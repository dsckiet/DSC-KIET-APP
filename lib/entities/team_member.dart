class TeamMember {
  final String name,
      linkedin,
      github,
      email,
      domain,
      otherUrl,
      dob,
      role,
      image;

  TeamMember(this.name, this.linkedin, this.github, this.email, this.domain,
      this.otherUrl, this.dob, this.role, this.image);

  TeamMember.fromJSON(Map<String, String> data)
      : name = data['name'],
        linkedin = data['name'],
        github = data['github'],
        email = data['email'],
        domain = data['domain'],
        otherUrl = data['other_url'],
        dob = data['dob'],
        role = data['role'],
        image = data['image'];
}
