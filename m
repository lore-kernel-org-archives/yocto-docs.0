Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.6162.1618359597470538792
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=aALzcP4z;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 0DDB920B83D9; Tue, 13 Apr 2021 17:19:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0DDB920B83D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=hEet3HZNvkWTe2Pc2N4bIufj03TBOmfhrAi2F/ib3d8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aALzcP4z2y3pzvh93yd1/PCVSpnC8o3Uvb5Md8VoAdzRnqsdDLgTs2Sl2ZcTYsfzQ
	 dnzZiAdmRebGZtgLa8Wj5fUBCNLZPN8lb5qH+NPO5xhfjAYpr9ZavjKCw3lpWd20CC
	 1Olw8q0uMiUxG9bKCZJQpF799pcweZvra81fgBv0=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 04/13] overview-manual: fix git command line
Date: Tue, 13 Apr 2021 17:19:45 -0700
Message-Id: <11f34eda59f253011735f4845b79e90c0fbd07b0.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Paul Eggleton <paul.eggleton@microsoft.com>

There was an en dash here instead of a hyphen; this meant that the
command line could not be copied and pasted verbatim. (Admittedly that
is less likely here than in other examples, but let's correct it
anyway.)

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/overview-manual/development-environment.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/development-environment.rst b/=
documentation/overview-manual/development-environment.rst
index 6d1dbfc..a33f89e 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -542,7 +542,7 @@ descriptions and strategies on how to use these comma=
nds:
    in this form assumes the local branch already exists. This command is
    analogous to "cd".
=20
--  *git checkout =E2=80=93b working-branch upstream-branch:* Creates and
+-  *git checkout -b working-branch upstream-branch:* Creates and
    checks out a working branch on your local machine. The local branch
    tracks the upstream branch. You can use your local branch to isolate
    your work. It is a good idea to use local branches when adding
--=20
1.8.3.1

