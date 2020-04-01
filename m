Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.4354.1585711165256819085
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 20:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.88, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: ZhPT2L16/WOwhpgdCfV/49L0JeBSasiLi94jezgKnipbNXetEK08JIBXV/c1sTyasD61Ov4+uD
 yBIovslTc+Dw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 20:19:25 -0700
IronPort-SDR: 9RAi0XRJbedFGxnsbkcWDzsSZw4GSWMsEERxDT7u9BUDVf7fMCHcwVWM+Wgxs9TetmmnMX0sei
 2YU3spTIfCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,330,1580803200"; 
   d="scan'208";a="395798500"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2020 20:19:24 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 1/3] poky.ent: recommend python36-pip for CentOS
Date: Tue, 31 Mar 2020 20:19:14 -0700
Message-Id: <20200401031916.38433-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'python3' in EPEL7 is now Python 3.6, so we
should be recommending python36-pip

Python 3.4 is EOL [1]

[1] https://www.python.org/downloads/release/python-3410/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 documentation/poky.ent | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index eb5de9514..b9eaea6da 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -74,6 +74,6 @@
      $ sudo yum makecache
      $ sudo yum install gawk make wget tar bzip2 gzip python unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
-     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python34-pip xz \
+     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python36-pip xz \
      which SDL-devel xterm
      $ sudo pip3 install GitPython jinja2">
-- 
2.24.0

