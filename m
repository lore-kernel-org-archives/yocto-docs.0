Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EC0C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 03:58:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.7223.1633924683652949920
 for <docs@lists.yoctoproject.org>;
 Sun, 10 Oct 2021 20:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Bd8BwdWy;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id E9BA420B861E; Sun, 10 Oct 2021 20:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E9BA420B861E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1633924682;
	bh=RKwBsHqKqykgW5gVnbT18itSajKTkH63+oUGd83lVAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Bd8BwdWy4yDpI7cxzVe9w2NXNbVTruAOeoPYO/Abjd3SfNCsquglL+W37aue0y3jG
	 Q+r08FWb0owex05LIePFPrS6InnZEPYndRmxq6ww2z8sJSQG+DP1s3rQfTt0T0qwWP
	 6OjZInbMa+pRA1jl2UO+rxzDWFfw7eGs9ithOb7w=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/5] poky.yaml: add lz4 and zstd to essential host packages
Date: Sun, 10 Oct 2021 20:57:55 -0700
Message-Id: 
 <d32cb6779a61e7ae8ad5e239e6db8a5cc3f96522.1633924455.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
References: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Oct 2021 03:58:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1983

From: Paul Eggleton <paul.eggleton@microsoft.com>

These are now required so update the corresponding distro-specific
lists used in the system requirements documentation.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/poky.yaml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index feb792f..50d1f9c 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -14,23 +14,24 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     pylint3 xterm python3-subunit mesa-common-dev"
+     pylint3 xterm python3-subunit mesa-common-dev zstd lz4"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
      python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
-     perl-File-Copy perl-locale"
+     perl-File-Copy perl-locale zstd lz4"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel
+     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel \
+     zstd lz4
      \n\      $ sudo pip3 install GitPython"
 CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\      $ sudo yum makecache
      \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
      perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python36-pip xz \
-     which SDL-devel xterm mesa-libGL-devel
+     which SDL-devel xterm mesa-libGL-devel zstd lz4
      \n\      $ sudo pip3 install GitPython jinja2"
 CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\      $ sudo dnf config-manager --set-enabled PowerTools
@@ -39,7 +40,7 @@ CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
-     rpcgen mesa-libGL-devel"
+     rpcgen mesa-libGL-devel zstd lz4"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.6.0"
 MIN_TAR_VERSION : "1.28"
-- 
1.8.3.1


