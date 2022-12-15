enum LockState{
  unlocked("Açık"),
  locked("Kapalı"),
  trunklocked("Bagaj Kapalı");


  final String value;
  const LockState(this.value);
}
