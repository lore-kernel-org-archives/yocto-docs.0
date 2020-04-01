Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.4354.1585711165256819085
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 20:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: YK1kzeq3y3qfR3dbNxaWSyJnbTzYaIfJeF4/GDb1jGdbI5heFM+YNYF2x7tPNAUJ6/y98gfXws
 ABUd23Di8eDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 20:19:29 -0700
IronPort-SDR: W6W2vVtT9E7XtGJcCbID4mWUZgqUj6FojSkcY5qxgL3Z2JfFbByt6gG7Dg7A3jfMdg3X+anzRj
 Ohul+C5SSSqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,330,1580803200"; 
   d="scan'208";a="395798514"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2020 20:19:28 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 2/3] poky.ent: split centos-7 and centos-8
Date: Tue, 31 Mar 2020 20:19:15 -0700
Message-Id: <20200401031916.38433-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200401031916.38433-1-timothy.t.orling@linux.intel.com>
References: <20200401031916.38433-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Centos-7 to require python3, not python.

CentOS-8 has different installation requirements than
either CentOS-7 or Fedora (although it is closer to
Fedora).

Allow for differentiation between CentOS versions.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 documentation/poky.ent | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index b9eaea6da..742c88147 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -70,10 +70,18 @@
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen
      $ sudo pip3 install GitPython">
-<!ENTITY CENTOS_HOST_PACKAGES_ESSENTIAL "-y epel-release
+<!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y epel-release
      $ sudo yum makecache
-     $ sudo yum install gawk make wget tar bzip2 gzip python unzip perl patch \
+     $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
      perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python36-pip xz \
      which SDL-devel xterm
      $ sudo pip3 install GitPython jinja2">
+<!ENTITY CENTOS8_HOST_PACKAGES_ESSENTIAL "-y epel-release
+     $ sudo dnf config-manager --set-enabled PowerTools
+     $ sudo dnf makecache
+     $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
+     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
+     socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
+     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
+     rpcgen">
-- 
2.24.0

