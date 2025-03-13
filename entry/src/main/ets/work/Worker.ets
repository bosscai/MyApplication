import worker from '@ohos.worker';

let TAG = "WORKER_SUB_THREAD"

// 获取对应的 ThreadWorkerGlobalScope 实例
const workerPort = worker.workerPort;

// 给ThreadWorkerGlobalScope的onmessage赋值，监听宿主线程发送过来的消息
workerPort.onmessage = (data) => {
  console.log(`${TAG}, workerPort.onMessage: ` + JSON.stringify(data));
  setTimeout(() => {
    // 耗时结束后，向宿主线程发送消息
    workerPort.postMessage("Hello, Worker, I'm sub thread");
  }, 3000);
}

// 给ThreadWorkerGlobalScope的onmessageerror赋值，监听异常情况
workerPort.onmessageerror = (error) => {
  console.log(`${TAG}, workerPort.onmessageerror: ` + JSON.stringify(error));
}