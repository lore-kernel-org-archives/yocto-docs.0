Subject: Re: [PATCH v2] UBUNTU sudo apt git instead of git-core
To: docs@lists.yoctoproject.org
From: "Janne Kiiskila" <janne.kiiskila@pelion.com>
X-Originating-Location: Oulu, North Ostrobothnia, FI (91.145.126.33)
X-Originating-Platform: Windows Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Mar 2021 10:16:25 -0700
References: <ce7645b2-602f-a675-3c9d-b17f0a742c87@bootlin.com>
In-Reply-To: <ce7645b2-602f-a675-3c9d-b17f0a742c87@bootlin.com>
Message-ID: <5247.1617038185636605896@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="QS9hQz8dJ7rs3BgsWOBp"

--QS9hQz8dJ7rs3BgsWOBp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From d7a40397af511baf3a53d12541ee601849f0ab26 Mon Sep 17 00:00:00 2001
From: Janne Kiiskila <janne.kiiskila@pelion.com>
Date: Tue, 23 Mar 2021 11:11:39 -0700
Subject: [PATCH v2] UBUNTU sudo apt git instead of git-core

Ubuntu has changed packaging and git-core is not available anymore,
it is now just plain git.

$ sudo apt-get install git-core
[sudo] password for jankii01:
Reading package lists... Done
Building dependency tree
Reading state information... Done
Note, selecting 'git' instead of 'git-core'
git is already the newest version (1:2.17.1-1ubuntu0.8).
The following package was automatically installed and is no longer require=
d:
linux-hwe-5.4-headers-5.4.0-65
Use 'sudo apt autoremove' to remove it.
0 upgraded, 0 newly installed, 0 to remove and 13 not upgraded.

Documentation should match the current package name to avoid confusion/war=
nings.

Change can be verified by running the following script

set -ex

distros=3D("debian:8" "debian:9" "debian:10" "ubuntu:16.04" "ubuntu:18.04"=
 "ubuntu:20.04")
for i in "${distros[@]}"
do
folder=3D"${i/:/.}"=C2=A0 =C2=A0 =C2=A0 # change : to .
mkdir -p $folder
cd $folder
echo FROM $i > Dockerfile
echo RUN apt-get update \&\& apt-get install -y git >> Dockerfile
echo
cat Dockerfile
docker build -t test-$folder .
cd ..
rm $folder/Dockerfile
rmdir $folder
done

Signed-off-by: Janne Kiiskila <janne.kiiskila@pelion.com>
---
documentation/poky.yaml | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 3c30c4430e..2554f1e496 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -11,7 +11,7 @@ YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
YOCTO_DL_URL : "https://downloads.yoctoproject.org"
YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texin=
fo gcc-multilib \
+UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gc=
c-multilib \
build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa =
libsdl1.2-dev \
pylint3 xterm python3-subunit mesa-common-dev"
--
2.17.1

--QS9hQz8dJ7rs3BgsWOBp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>From d7a40397af511baf3a53d12541ee601849f0ab26 Mon Sep 17 00:00:00 2001=
</div>
<div>From: Janne Kiiskila &lt;janne.kiiskila@pelion.com&gt;</div>
<div>Date: Tue, 23 Mar 2021 11:11:39 -0700</div>
<div>Subject: [PATCH v2] UBUNTU sudo apt git instead of git-core</div>
<div>&nbsp;</div>
<div>Ubuntu has changed packaging and git-core is not available anymore,</=
div>
<div>it is now just plain git.</div>
<div>&nbsp;</div>
<div>$ sudo apt-get install git-core</div>
<div>[sudo] password for jankii01:</div>
<div>Reading package lists... Done</div>
<div>Building dependency tree</div>
<div>Reading state information... Done</div>
<div>Note, selecting 'git' instead of 'git-core'</div>
<div>git is already the newest version (1:2.17.1-1ubuntu0.8).</div>
<div>The following package was automatically installed and is no longer re=
quired:</div>
<div>&nbsp; linux-hwe-5.4-headers-5.4.0-65</div>
<div>Use 'sudo apt autoremove' to remove it.</div>
<div>0 upgraded, 0 newly installed, 0 to remove and 13 not upgraded.</div>
<div>&nbsp;</div>
<div>Documentation should match the current package name to avoid confusio=
n/warnings.</div>
<div>&nbsp;</div>
<div>Change can be verified by running the following script</div>
<div>&nbsp;</div>
<div>set -ex</div>
<div>&nbsp;</div>
<div>distros=3D("debian:8" "debian:9" "debian:10" "ubuntu:16.04" "ubuntu:1=
8.04" "ubuntu:20.04")</div>
<div>for i in "${distros[@]}"</div>
<div>do</div>
<div>&nbsp; &nbsp;folder=3D"${i/:/.}"&nbsp; &nbsp; &nbsp; # change : to .<=
/div>
<div>&nbsp; &nbsp;mkdir -p $folder</div>
<div>&nbsp; &nbsp;cd $folder</div>
<div>&nbsp; &nbsp;echo FROM $i &gt; Dockerfile</div>
<div>&nbsp; &nbsp;echo RUN apt-get update \&amp;\&amp; apt-get install -y =
git &gt;&gt; Dockerfile</div>
<div>&nbsp; &nbsp;echo</div>
<div>&nbsp; &nbsp;cat Dockerfile</div>
<div>&nbsp; &nbsp;docker build -t test-$folder .</div>
<div>&nbsp; &nbsp;cd ..</div>
<div>&nbsp; &nbsp;rm $folder/Dockerfile</div>
<div>&nbsp; &nbsp;rmdir $folder</div>
<div>done</div>
<div>&nbsp;</div>
<div>Signed-off-by: Janne Kiiskila &lt;janne.kiiskila@pelion.com&gt;</div>
<div>---</div>
<div>&nbsp;documentation/poky.yaml | 2 +-</div>
<div>&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div>&nbsp;</div>
<div>diff --git a/documentation/poky.yaml b/documentation/poky.yaml</div>
<div>index 3c30c4430e..2554f1e496 100644</div>
<div>--- a/documentation/poky.yaml</div>
<div>+++ b/documentation/poky.yaml</div>
<div>@@ -11,7 +11,7 @@ YOCTO_POKY : "poky-&amp;DISTRO_NAME_NO_CAP;-&amp;PO=
KYVERSION;"</div>
<div>&nbsp;YOCTO_DL_URL : "https://downloads.yoctoproject.org"</div>
<div>&nbsp;YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"</div>
<div>&nbsp;YOCTO_RELEASE_DL_URL : "&amp;YOCTO_DL_URL;/releases/yocto/yocto=
-&amp;DISTRO;"</div>
<div>-UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip =
texinfo gcc-multilib \</div>
<div>+UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texin=
fo gcc-multilib \</div>
<div>&nbsp; &nbsp; &nbsp; build-essential chrpath socat cpio python3 pytho=
n3-pip python3-pexpect \</div>
<div>&nbsp; &nbsp; &nbsp; xz-utils debianutils iputils-ping python3-git py=
thon3-jinja2 libegl1-mesa libsdl1.2-dev \</div>
<div>&nbsp; &nbsp; &nbsp; pylint3 xterm python3-subunit mesa-common-dev"</=
div>
<div>--&nbsp;</div>
<div>2.17.1</div>
<div>&nbsp;</div>

--QS9hQz8dJ7rs3BgsWOBp--
