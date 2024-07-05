import * as vscode from 'vscode';
import * as cp from 'child_process';

export function activate(context: vscode.ExtensionContext) {
  let disposable = vscode.commands.registerCommand('myExtension.runScript', () => {
	cp.exec('git-pick.sh', (err, stdout, stderr) => {
	  if (err) {
		vscode.window.showErrorMessage(`Failed to run script: ${err.message}`);
	  } else {
		vscode.window.showInformationMessage(`Script output: ${stdout}`);
	  }
	});
  });

  context.subscriptions.push(disposable);
}

export function deactivate() {}
