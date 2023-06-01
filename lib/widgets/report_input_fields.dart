import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';

TextEditingController _incidentController = TextEditingController();
TextEditingController _severityController = TextEditingController();
TextEditingController _locationController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();





String? _incident;
String? _severity;
String? _date;
String? _location;

SizedBox reportFormInputIncidentType() {
  return SizedBox(
    child: TextFormField(
      maxLines: 1,
      controller: _incidentController,
      decoration: const InputDecoration(
        hintText: 'Enter type of incident',
        labelText: 'Incident type E.g Robbery, Kidnapping*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      onSaved: (newValue) => _incident = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
        } else if (value.length >= 8) {}
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return incidentError;
        }
        return null;
      },
    ),
  );
}

SizedBox reportFormInputDate() {
  return SizedBox(
    child: TextFormField(
      
      maxLines: 1,
      // controller: _dateController,
      decoration: const InputDecoration(
        
        hintText: 'Date of incident',
        labelText: 'DD/MM/YYYY*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      onSaved: (newValue) => _date = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
        } else if (value.length >= 8) {}
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return incidentError;
        }
        return null;
      },
    ),
  );
}

SizedBox reportFormInputSeverity() {
  return SizedBox(
    child: TextFormField(
      maxLines: 1,
      controller: _severityController,
      decoration: const InputDecoration(
        hintText: 'Select how severe',
        labelText: 'severity*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      onSaved: (newValue) => _severity = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
        } else if (value.length >= 8) {}
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return incidentError;
        }
        return null;
      },
    ),
  );
}

SizedBox reportFormInputLocation() {
  return SizedBox(
    child: TextFormField(
      maxLines: 1,
      controller: _locationController,
      decoration: const InputDecoration(
        hintText: 'Enter type the incident location',
        labelText: 'Location*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      onSaved: (newValue) => _location = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
        } else if (value.length >= 8) {}
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return incidentError;
        }
        return null;
      },
    ),
  );
}

SizedBox reportFormInputDescription() {
  return SizedBox(
    child: TextField(
      minLines: 6,
      keyboardType: TextInputType.multiline,
      maxLines: null,

      controller: _descriptionController,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        hintText: 'Detailed incident description',
        labelText: 'Description*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      // onSaved: (newValue) => _incident = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //   } else if (value.length >= 8) {}
      //   return;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return incidentError;
      //   }
      //   return null;
      // },
    ),
  );
}
