Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7416.1603885001959991221
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 04:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=eG2t5RXl;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 2DE5720B4905; Wed, 28 Oct 2020 04:36:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2DE5720B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603884997;
	bh=gcerYWiueemkUd23MrZb1iwYHDBPImmg44O7sc2hnQc=;
	h=From:To:Subject:Date:From;
	b=eG2t5RXl21wZ4JbLp4f/jAdUgMfEaGQcW8LLZ368a2LZfK9zN8IHsJtMHvi2rM1KR
	 Cmuu7nY0zEnBSUQkTj7bqKoPXcP4Z50pIT9ZR3q386pPeEk0GxEQN81mrHRugm63N6
	 dBNvz/kUHmsNQ6aroGTmZAfK/gX7mswRRduZCjDM=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/3] Additional migration info for 3.2
Date: Wed, 28 Oct 2020 04:36:22 -0700
Message-Id: <cover.1603884913.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

These patches should be applied after the set I sent earlier today.


The following changes since commit 18956e99fafa0d898c37a785e44015af2eb532d8:

  ref-manual: add migration section for 3.2 (2020-10-27 15:58:19 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/migration-3.2-fixup
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/migration-3.2-fixup

Paul Eggleton (3):
  ref-manual: add IMAGE_LINK_NAME
  ref-manual: add migration info for image-artifact-names
  ref-manual: add migration info about MLPREFIX changes

 documentation/ref-manual/migration-3.2.rst | 52 ++++++++++++++++++++++++++++++
 documentation/ref-manual/ref-variables.rst | 11 +++++++
 2 files changed, 63 insertions(+)

-- 
1.8.3.1

