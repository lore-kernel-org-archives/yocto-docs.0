Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3711FC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:39:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.56202.1697812779395097781
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 07:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CECAkdR4;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32caaa1c493so663228f8f.3
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697812777; x=1698417577; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86vxqvh8CMBUl0YDhmf2T5XG9y+4RzHkOtSzRWYXF4M=;
        b=CECAkdR4rb/GAg8wg09dqsbiRq63pXKBH7rbkkKhIHKtSqcNJ6JmJjalkvp4CjtP1y
         EGs6Gs0HxFj9tH/Ame/SN29rcmfdQ1FsxpRRqXQbIimiBjpH+cGomMjZ9ot3GcK2HBdn
         9gK2GXp3hlv2OiubXC0Fd61GQP8qz0jbaPVXQDQAoQckk55c51/+uoMt3yqG3+kbBXw1
         40pRQLiogaNyP0pkQ8bRpeE4dh6EEWYvUaNnxOKeVxUO9LkF4mQDyGuwlkCi/bDtiYhh
         1Y1xJW+d9qNHUuhR5fIlIKYT8rjIXcwYx8KeftuthyB/YICCt0xhG+0OLme9VfuLhPL6
         eyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697812777; x=1698417577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86vxqvh8CMBUl0YDhmf2T5XG9y+4RzHkOtSzRWYXF4M=;
        b=bibdx7+Sn9WVKMQnrraBnfg5TBR5WfooJ3Dq4ueNz8b6QQJyef3lVZO9MSyrekir1I
         f/c2YQFlvFQimYG9FJpulYWtQ35WfuZZLWM80tpUJRNTy4pnvpjVDiRt4ov2j4fP9TGP
         mtWT0IMIia1CbFwR2ksgyMfRfyv6ZR2+NAGp03GdrmPqqh7nzJIrwaFoN53ayQiG3rY8
         gWq9a2ksPyL7+DpkioM9F9ubjyRWE8jq5EM0Ganwzlnh2+NBGqWc0sDVYUPNkaxOShuK
         FFQf7pGYTVTKrTDNA4mY8QDN/xzjeidzQkJDM3Yw5o6dILV7x/XXecgnt4nIAOnEtNpJ
         w4Zw==
X-Gm-Message-State: AOJu0Ywex9b+Q0v2WptASvAFQnBjM7RGzAw9uruhWYuu/ENK48hUckLv
	A0I+vTjLe3wa4XeXwxHPmAzwB4gR7HI=
X-Google-Smtp-Source: AGHT+IG0e0qOwYMCjvVmlLC9OYHCRRAyhqcDYwBAQWgdkAu6Vx4/iNtUdWhzNoeQ3DrDsrYnBxofOw==
X-Received: by 2002:adf:e58f:0:b0:31f:a0ab:26b5 with SMTP id l15-20020adfe58f000000b0031fa0ab26b5mr1614590wrm.8.1697812776731;
        Fri, 20 Oct 2023 07:39:36 -0700 (PDT)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id o22-20020a5d58d6000000b003143867d2ebsm1811985wrf.63.2023.10.20.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:39:36 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v2][docs] dev--manual: add security team processes
Date: Fri, 20 Oct 2023 16:39:28 +0200
Message-Id: <20231020143928.1700522-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 14:39:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4446

Add the initial version of the section on vulnerability reports,
operations of the Security Team with a
transcription of https://wiki.yoctoproject.org/wiki/Security_private_reporting

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 documentation/dev-manual/index.rst            |   1 +
 .../dev-manual/security-subjects.rst          | 197 ++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 documentation/dev-manual/security-subjects.rst

diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 3106b90a4..9ccf60f70 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -42,6 +42,7 @@ Yocto Project Development Tasks Manual
    runtime-testing
    debugging
    licenses
+   security-subjects
    vulnerabilities
    sbom
    error-reporting-tool
diff --git a/documentation/dev-manual/security-subjects.rst b/documentation/dev-manual/security-subjects.rst
new file mode 100644
index 000000000..feec5f337
--- /dev/null
+++ b/documentation/dev-manual/security-subjects.rst
@@ -0,0 +1,197 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Dealing with Vulnerability Reports
+**********************************
+
+The Yocto Project and OpenEmbedded are open-source, community-based projects
+used in numerous products. They assemble multiple other open-source projects,
+and need to handle security issues and practices both internal (in the code
+maintained by both projects), and external (maintained by otehr projects and
+organizations).
+
+This manual assembles security-related information concerning the whole
+ecosystem. It includes information on reporting a potential security issue,
+the operation of the YP Security team and how to contribute in the
+related code. It is written to be useful for both security researchers and
+YP developers.
+
+How to report a potential security vulnerability?
+=================================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it using the
+:yocto_bugs:`Security Bugzilla </enter_bug.cgi?product=Security>`.
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to security AT yoctoproject DOT org, including as many details as
+possible: the layer or software module affected, the recipe and its version,
+and any example code, if available. This mailing list is monitored by the
+Yocto Project Security team.
+
+For each layer, you might also look for specific instructions (if any) for
+reporting potential security issues in the specific ``SECURITY.md`` file at the
+root of the repository. Instructions on how and where submit a patch are
+usually available in ``README.md``. If this is your first patch to the
+Yocto Project/OpenEmbedded, you might want to have a look into the
+Contributor's Manual section
+":ref:`contributor-guide/submit-changes:preparing changes for submission`".
+
+Branches maintained with security fixes
+========================================
+
+See the :yocto_wiki:`Stable release and LTS </Stable_Release_and_LTS>`
+wiki page for detailed info regarding the policies and maintenance of stable
+branches.
+
+The :yocto_wiki:`Releases page </Releases>` contains a list
+of all releases of the Yocto Project. Versions in grey are no longer actively
+maintained with security patches, but well-tested patches may still be accepted
+for them for significant issues.
+
+Security-reated discussions at the Yocto Project
+================================================
+
+We have set up two security-related mailing lists:
+
+  -  Public List yocto [dash] security [at] yoctoproject[dot] org
+
+    This is a public mailing list for anyone to subscribe to. This list is an
+    open list to discuss public security issues/patches and security-related
+    initiatives. For more information, including subscription information,
+    please see the yocto-security mailing list info page.
+
+  - Private List security [at] yoctoproject [dot] org
+
+    This is a private mailing list for reporting non-published potential
+    vulnerabilities. The list is monitored by the Yocto Project Security team.
+
+
+What you should do if you find a security vulnerability
+-------------------------------------------------------
+
+If you find a security flaw; a crash, an information leakage, or anything that
+can have a security impact if exploited in any Open Source software built or
+used by the Yocto Project, please report this to the Yocto Project Security
+Team. If you prefer to contact the upstream project directly, please send a
+copy to the security team at the Yocto Project as well. If you believe this is
+highly sensitive information, please report the vulnerability in a secure way,
+i.e. encrypt the email and send it to the private list. This ensures that
+the exploit is not leaked and exploited before a response/fix has been generated.
+
+
+What Yocto Security Team does when it receives a security vulnerability
+-----------------------------------------------------------------------
+
+The YP Security Team team performs a quick analysis and would usually report
+the flaw to the upstream project. Normally the upstream project analyzes the
+problem. If they deem it a real security problem in their software, they
+develop and release a fix following their own security policy. They may want
+to include the original reporter in the loop. There is also sometimes some
+coordination for handling patches, backporting patches etc, or just
+understanding the problem or what caused it.
+
+The security policy of the upstream project might include a notification to
+Linux distributions or other important downstream projects in advance to
+discuss coordinated disclosure. These mailing lists are normally non-public.
+
+When the upstream project releases a version with the fix, they are responsible
+for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number assigned and
+the CVE record published.
+
+If an upstream project does not respond quickly
+-----------------------------------------------
+
+If an upstream project does not fix the problem in a reasonable time,
+the Yocto's Security Team will contact other interested parties (usually
+other distributions) in the community and together try to solve the
+vulnerability as quickly as possible.
+
+The Yocto Project Security team adheres to the 90 days disclosure policy
+by default. An increase of the embargo time is possible when necessary.
+
+Security team
+=============
+
+The Yocto Project/OpenEmbedded security team coordinates the work on security
+subjects in the project. All general discussion takes place publicly. The
+Security Team only uses confidential communication tools to deal with private
+vulnerability reports before they are released.
+
+Security team appointment
+-------------------------
+
+The Yocto Project Security Team consists of at least three members. When new
+members are needed, the YP TSC asks for nominations by public channels including
+a nomination deadline. Self-nominations are possible. When the limit time is
+reached, the YP TSC posts the list of candidates for the comments of project
+participants and developers. Comments may be sent publicly or privately to the
+YP and OE TSCs. The candidates are approved by both YP TSC and OE TSC and the
+final list of the team members is announced publicly. The aim is to have people
+representing technical leadership, security knowledge and infrastructure present
+with enough people to provide backup/coverage but keep the notification list
+small enough to minimise information risk and maintain trust.
+
+YP Security Team members may resign at any time.
+
+Security Team Operations
+------------------------
+
+The work of the Security Team might require high confidentiality. Team members
+are individuals selected by merit and do not represent the companies they work
+for. They do not share information about confidential issues outside of the team
+and do not hint about ongoing embargoes.
+
+Team members can bring in domain experts as needed. Those people should be
+added to individual issues only and adhere to the same standards as the YP
+Security Team.
+
+The YP security team organizes its meetings and communication as needed.
+
+When the YP Security team receives a report about a potential security
+vulnerability, they quickly analyze and notify the reporter of the result.
+They might also request more information.
+
+If the issue is confirmed and affects the code maintained by the YP, they
+confidentially notify maintainers of that code and work with them to prepare
+a fix.
+
+If the issue is confirmed and affects an upstream project, the YP security team
+notifies the project. Usually, the upstream project analyzes the problem again.
+If they deem it a real security problem in their software, they develop and
+release a fix following their security policy. They may want to include the
+original reporter in the loop. There is also sometimes some coordination for
+handling patches, backporting patches etc, or just understanding the problem
+or what caused it.
+
+The security policy of the upstream project might include a notification to
+Linux distributions or other important downstream projects in advance to discuss
+coordinated disclosure. These mailing lists are generally non-public. The YP
+Security Team participates in the discussion as needed. They might also
+include the YP maintainer of the affected package.
+
+When the upstream project releases a version with the fix, they are responsible
+for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number assigned
+and the CVE record published.
+
+When the fix is publicly available, the YP security team member or the
+package maintainer sends patches against the YP code base, following usual
+procedures, including public code review.
+
+Current Security Team members
+-----------------------------
+
+For secure communications, please send your messages encrypted using the GPG
+keys. Remember, message headers are not encrypted so do not include sensitive
+information in the subject line.
+
+  -  Ross Burton <ross@burtonini.com> `Public key <https://keys.openpgp.org/search?q=ross%40burtonini.com>`__
+
+  -  Michael Halstead <mhalstead [at] linuxfoundation [dot] org>
+     `Public key <https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3373170601861969>`__
+     or `Public key <https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xd1f2407285e571ed12a407a73373170601861969>`__
+
+  -  Richard Purdie <richard.purdie@linuxfoundation.org> `Public key <https://keys.openpgp.org/search?q=richard.purdie%40linuxfoundation.org>`__
+
+  -  Marta Rybczynska <marta DOT rybczynska [at] syslinbit [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
+
+  -  Steve Sakoman <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__
-- 
2.39.2


