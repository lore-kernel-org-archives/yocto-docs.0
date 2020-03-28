Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.2271.1585387273453181446
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 02:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Kl1FV7so;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4AEBF2010EF4;
	Sat, 28 Mar 2020 02:21:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4AEBF2010EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585387272;
	bh=icSzdTTHe6kIxLZtr0senQl5l7OroVjfFZHb7vLCPWU=;
	h=From:To:Cc:Subject:Date:From;
	b=Kl1FV7soem1itVH9uCt2BgpcVdPV4PxCIT73CqLOnX94kvCvteFPgnLcQEYKkQi81
	 ERIRmGSJDltih4MOahGhGWLRAffLbiWP5YaoCpSo5zX7wBEzAF8Jg3C8pljCjFJxag
	 1vAy/bMDTot+JR/E/K1RaDkFH8+vYks6ak2Lyjnk=
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH 0/3] Fix CROPS about link
Date: Sat, 28 Mar 2020 02:21:03 -0700
Message-Id: <20200328092106.28231-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

The CROPS link was outdated in several parts of the
documentation, there is not a lot to say about this
other than I updated it to the most reasonable link
I could find, and Scott seemed to use separate commits
for each different document, I'd be fine squashing
this into one commit but I tried keeping up with
what he was doing.

Alejandro Hernandez Samaniego (3):
  dev-manual: Fix CROPS link
  overview-manual-development-environment: Fix CROPS link
  overview-manual-yp-intro: Fix CROPS link

 documentation/dev-manual/dev-manual-start.xml                 | 4 ++--
 .../overview-manual-development-environment.xml               | 2 +-
 documentation/overview-manual/overview-manual-yp-intro.xml    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1

