Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F2EC61DE4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 02:13:09 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21087.1788142383768647696
 for <docs@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 19:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UmOyAi3e;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9390c3ade1dso138258185a.0
        for <docs@lists.yoctoproject.org>; Sun, 30 Aug 2026 19:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788142383; x=1788747183; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nOqTF9qxt3rEEJ1ouXeOmHPl4bYVPcSDG0e9mdW+TCU=;
        b=UmOyAi3eNLUvtQjawVWKMA6Ux/goxekGSx2bXxhM/ovLGRf8XivNdFGLt50CmxMuw6
         FI1ZPJHzKQxlwWNA3VwL34PJGnMkhydPzISLLf+FrOc/ElxDUs4aN+XH3hY86CEyYcnH
         j7F6n6SqNmCPIIcJvuORjkZYyIyYSuHFfDF7Ghrtb/S1cqZKfG5uAUg4eMsp4VRtP+Xi
         +PLUnhJYJwEvMIDlGH/AR6oAKgFy4TSA29SSzp9WrUeX9dzg8Xxf/7qy48gKRPhcVRVs
         LU03lNlQX/CIBpO8nt3iYHXp0zoGz/eF4sGA8apkmnqYJUahHvcim01BQeHNWDK/mMeU
         WIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142383; x=1788747183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nOqTF9qxt3rEEJ1ouXeOmHPl4bYVPcSDG0e9mdW+TCU=;
        b=n2TBmgHPDnBYtlaWNrItN8oWpeV54ZxHFnMPdTPOHERtKCVI1/bvfj5rP1s0dlqc5H
         EXO9C7Mm6aNoJw12UPkFGbJ0XxQA3optNNEPxOq4d4sXk071IARFugJnOJGnY3wFy/rZ
         qpenAxR0P8XTjV43PcwVbT14uZDNdtOBEMu+QQv6SCFdbl6tHJAaOwvMq5b+tEon6Opd
         LxNWTYWh2CFhKMn5NJAUTv38ury15kA1b74lE42QdDf/W4QC717BNIpNJHIT0XUpT0UY
         U55YGkljDWei+hxJhp6Mq44a9ctK9RWcWjb86aj2bwlr7kFB66Dwgmi5uDMgZfgByu83
         pSzA==
X-Gm-Message-State: AFuF++kAovsNiYW08dnlUbR6dE5ms1I7106PsSOOw854yaY7YJKt4EK1
	FPtg1hLTnYExHNEygAaDCG7OAKmHZggdjlZsAUBhxQjrglzg2oxuOzIWhpQkZLXc
X-Gm-Gg: AR+sD12gENN3xrHMpMqKaKS73enQeMrsaB3FATVWytNUGbCMfommrmCjoqd60ZIKDFe
	0r+WC7ZAUfdculNC2rJVMYuobhLycftRvDNDNcqbW4dB2eyDidvzfum5VOgMVCQ41/714gBAXCt
	qLSubRjNHSuOoZX3QOfcFIGv/jtr3+oAo5zu6pGVQi1ZiE4p6hwaO5LzL2EJailIbpUtKDrrJJa
	BU7LIWbGRLXEblSiCOVy6LOPWeLk1pKfbActCvQo1C5/OFqNvCVbNtPGnylepixm/9Rq1r+SFfx
	n3KQ0Zdmqswbw/ucOcoF3Qi/CszN9XV2PxU7A0Y38VChCEPWEUZs5ICcs8FX+zRGL0A4mNhUZp8
	a6hBmMj94K6rWSYAOZeYGW/pCX4gQZ0CvpbbSIUpr0zx6K+qRplxzqQjV90JwbZlan0Amo0R55k
	Yf9klsRss+vc9xYV9v8M8g5TOE0wiJeDdyi/mc3XBr9X4fK5mJxltrFOY9tIs35CoXk7Gk/lCDX
	ckXeBapDvujuyjDIoyTuSsyrPBvtg==
X-Received: by 2002:a05:620a:5d83:b0:92f:279:5953 with SMTP id af79cd13be357-939138ae01emr2158969185a.27.1788142382664;
        Sun, 30 Aug 2026 19:13:02 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm660825185a.40.2026.08.30.19.13.01
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:13:01 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/4] dev-manual: quote the values in two recipe examples
Date: Sun, 30 Aug 2026 22:12:54 -0400
Message-ID: <20260831021255.4064163-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260831021255.4064163-1-twoerner@gmail.com>
References: <20260831021255.4064163-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 02:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10409

Both fail to parse.

AI-Generated: codex/claude opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/dev-manual/new-recipe.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index d1c863117259..3f360597f998 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1055,7 +1055,7 @@ correctly trigger an upgrade.
 In order to ensure the versions compare properly, the recommended
 convention is to use a tilde (``~``) character as follows::
 
-  PV = 0.8.16~rc1
+  PV = "0.8.16~rc1"
 
 This way ``0.8.16~rc1`` sorts before ``0.8.16``. See the
 ":ref:`contributor-guide/recipe-style-guide:version policy`" section in the
@@ -1656,7 +1656,7 @@ in the BitBake User Manual.
    You indicate Python code using the ``${@python_code}`` syntax for the
    variable assignment::
 
-      SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz
+      SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz"
 
 -  *Shell Function Syntax:* Write shell functions as if you were writing
    a shell script when you describe a list of actions to take. You
-- 
2.50.0.173.g8b6f19ccfc3a


