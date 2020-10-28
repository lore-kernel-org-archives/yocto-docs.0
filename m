Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.2248.1603847917890910735
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 18:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ntnrFhgW;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 4C91E20B4905; Tue, 27 Oct 2020 18:18:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4C91E20B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603847917;
	bh=07JykAstB4vrn4GozLq6y4AtLRpPlEeRV/MocBmZZOc=;
	h=From:To:Subject:Date:From;
	b=ntnrFhgWO3yEHKc8P7Cr+j/ghuetISrv5sk0N5+sRENUjN4vX9RvfpQXR/syMM8QR
	 AouVtZBbO4tw8EC7M+Wa5qY+/To00DCkFjdRcgxtbctjrr5akNS5Vg8B+Qv67c9tll
	 y/4bFnF9eYoM1lWBhXnL/D0E3oW8itOfZ8IbwIIU=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/7] Migration info for gatesgarth + updates
Date: Tue, 27 Oct 2020 18:18:28 -0700
Message-Id: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

The migration section for the upcoming gatesgarth release as well as
some related updates to other parts of the reference manual. Let me
know if I missed anything.


The following changes since commit 14d0c205c671c4c670d7a887d307d359f70e1b7a:

  dev-manual/dev-manual-common-tasks: fix typos and use extlinks (2020-10-27 13:20:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/migration-3.2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/migration-3.2

Paul Eggleton (7):
  ref-manual: add reference anchors for each QA check
  ref-manual: fix for features_check class change
  ref-manual: QA check updates
  ref-manual: add PSEUDO_IGNORE_PATHS
  ref-manual: add IMAGE_VERSION_SUFFIX variable
  ref-manual: add IMAGE_NAME_SUFFIX variable
  ref-manual: add migration section for 3.2

 documentation/ref-manual/migration-3.2.rst | 261 +++++++++++++++++++++++++++++
 documentation/ref-manual/migration.rst     |   1 +
 documentation/ref-manual/ref-classes.rst   |  41 +++--
 documentation/ref-manual/ref-qa-checks.rst | 243 ++++++++++++++++++++++++++-
 documentation/ref-manual/ref-variables.rst |  61 +++++--
 5 files changed, 571 insertions(+), 36 deletions(-)
 create mode 100644 documentation/ref-manual/migration-3.2.rst

-- 
1.8.3.1

