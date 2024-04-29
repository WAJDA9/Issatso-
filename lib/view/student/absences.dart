import 'package:flutter/material.dart';

class AbsencesScreen extends StatefulWidget {
  @override
  State<AbsencesScreen> createState() => _AbsencesScreenState();
}

class _AbsencesScreenState extends State<AbsencesScreen> {
  final List<SubjectAbsence> subjects = [
    SubjectAbsence(name: 'Mini Projet', absences: 2),
    SubjectAbsence(name: 'Base de données avancées', absences: 3),
    SubjectAbsence(name: 'Français 4', absences: 1),
    SubjectAbsence(name: 'Anglais 4', absences: 4),
    SubjectAbsence(name: 'Architectures logicielles et principes de conception', absences: 0),
    SubjectAbsence(name: 'Entrepôts de données', absences: 0),
    SubjectAbsence(name: 'Commerce Electronique', absences: 0),
    SubjectAbsence(name: 'Outils et ateliers avancés de génie logiciel', absences: 0),
    SubjectAbsence(name: 'Qualité, Audit, Gestion de projets', absences: 0),
    SubjectAbsence(name: 'Web 2.0 et Web 3.0', absences: 0),
    SubjectAbsence(name: 'Algorithmique et architectures parallèles', absences: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absences, Semester 2'),
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              splashColor: Color(0xFF6190BA),           
              title: Row(
                children: [
                  Expanded(
                    child: Text(subject.name),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      
                      setState(() {
                        subject.addAbsence();
                      });
                    },
                  ),
                ],
              ),
              subtitle: AbsenceProgressBar(absences: subject.absences),
              onTap: () {
                
              },
            ),
          );
        },
      ),
    );
  }
}

class SubjectAbsence {
  final String name;
  int absences;

  SubjectAbsence({required this.name, required this.absences});

  void addAbsence() {
    absences++;
  }
}

class AbsenceProgressBar extends StatelessWidget {
  final int absences;

  AbsenceProgressBar({required this.absences});

  @override
  Widget build(BuildContext context) {
    Color color;
    String status;

    if (absences >= 4) {
      color = Colors.red;
      status = 'Eliminated';
    } else if (absences >= 2) {
      color = Colors.orange;
      status = 'High Risk';
    } else {
      color = Colors.green;
      status = 'Good';
    }

    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: absences / 4,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
        SizedBox(width: 10),
        Text(
          status,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
