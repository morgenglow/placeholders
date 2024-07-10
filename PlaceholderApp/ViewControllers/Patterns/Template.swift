open class TemplateActions {
    // Template method
    final func printData() {
        prepare()
        actionInProcess()
        finish()
    }

    func prepare() {
        print("Preparing")
    }
    func finish() {
        print("finishing")
    }

    func actionInProcess() {
    }
}
