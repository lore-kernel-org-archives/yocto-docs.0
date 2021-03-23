Subject: [PATCH] UBUNTU sudo apt git instead of git-core
To: docs@lists.yoctoproject.org
From: janne.kiiskila@pelion.com
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Windows Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Mar 2021 11:14:22 -0700
Message-ID: <KkZH.1616523262298523931.IGi7@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="cmCYzXe5u6fnDxtd2g4I"

--cmCYzXe5u6fnDxtd2g4I
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From 6d672cf6dcb39e20d10ee2da012e372016fa3c38 Mon Sep 17 00:00:00 2001
From: Janne Kiiskila <janne.kiiskila@arm.com>
Date: Tue, 23 Mar 2021 11:11:39 -0700
Subject: [PATCH] UBUNTU sudo apt git instead of git-core

Ubuntu has changed packing and git-core is not available anymore,
it is now just plain git.

(pelion-venv) jankii01@ubuntu1804:~/poky/documentation$ sudo apt-get insta=
ll git-core
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

Documentaiton should match the current package name to avoid confusion/war=
nings.
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

--cmCYzXe5u6fnDxtd2g4I
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>From 6d672cf6dcb39e20d10ee2da012e372016fa3c38 Mon Sep 17 00:00:00 2001=
</div>
<div>From: Janne Kiiskila &lt;janne.kiiskila@arm.com&gt;</div>
<div>Date: Tue, 23 Mar 2021 11:11:39 -0700</div>
<div>Subject: [PATCH] UBUNTU sudo apt git instead of git-core</div>
<div>&nbsp;</div>
<div>Ubuntu has changed packing and git-core is not available anymore,</di=
v>
<div>it is now just plain git.</div>
<div>&nbsp;</div>
<div>(pelion-venv) jankii01@ubuntu1804:~/poky/documentation$ sudo apt-get =
install git-core</div>
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
<div>Documentaiton should match the current package name to avoid confusio=
n/warnings.</div>
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

--cmCYzXe5u6fnDxtd2g4I--
