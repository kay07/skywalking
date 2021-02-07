# skywalking
1.agent
Agent是skywalking集成到java项目必须的，可以直接从官方下载解压，下载地址为：
https://archive.apache.org/dist/skywalking/8.3.0/apache-skywalking-apm-es7-8.3.0.tar.gz，
这里需要注意一下有版本问题，不同agent版本可能导致无法集成java项目，比如7.0.0版本，为了避免采坑，这里给出的是一个可用的版本，下载完之后将agent包挂载到k8s的挂载路径下即可，如本代码中的地址是/public/sw/下，不用做任何修改！

2.Dockerfile
Dockerfile中需要注意的是在ENTRYPOINT中必须添加三个参数：
"-javaagent:/tmp/agent/skywalking-agent.jar",
"-Dskywalking.agent.service_name=system", "-Dskywalking.collector.backend_service=oap.skywalking:11800"
说明：第一个是agent的地址；第二个是skywalking展示时的名称，可以自由定义；第三个是oap的地址。这里有一个坑就是，这三个参数只能写到Dockerfile里，不能写到k8s的env环境变量里，否则无法集成java项目。

3.nginx.yaml
这是监控的java项目的某镜像，使用Dockerfile构建即可，需要注意的是这里的env是配置的nacos的信息，如果没有使用nacos，可以直接去的env这部分。

4.oap.yaml和ui.yaml
这是部署skywalking的yaml文件，oap是跟java交互的，ui是skywalking web端展示的，这里没什么难的，直接部署即可
