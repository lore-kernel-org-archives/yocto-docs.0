Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEC9E674A5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79012.1766406504144543902
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qMIIlOeV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6138FC1AE05;
	Mon, 22 Dec 2025 12:27:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60F9C606C1;
	Mon, 22 Dec 2025 12:28:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B8D310AB0282;
	Mon, 22 Dec 2025 13:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406498; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ORf06iWxRXT6oSDBSr22xZLa+6fy3dwfjniTBKTwhCo=;
	b=qMIIlOeVaoK/CgtuXrvXypmNkC7AAhRk+ZLnCCNB8eueFgj6RdtHBwaMjkaM1b5kQ03Hp7
	6tGZqDwLfQhO3o2xrrd2DcyOIFuzEZlyHboPxRO9xhaIhnz002SeQHKSluKzlieE/YkTWd
	ywgtkvGvn59tp72cUHdPYbedlc56cvkNe1+OXMK7lqRomegWFX4pzJvQZxoLJy7GjtA50B
	MEVzY0Cx7QOL+f8hrdibrgvKi1AW48R9YAhOjnWon3Hnsen6bhOKQSgWQJXCFvRudixOYt
	sDsh8YKYqkXiUwZjZk4e4se4wMB32wzWIAsUM8yFbP6RkQqgd6A89dxuQe5sLA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Dec 2025 13:27:50 +0100
Subject: [PATCH 4/8] tools/build-docs-container: create symlink to latest
 build output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-concurrent-safety-v1-4-e3d86e44cd38@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c+hVxa6AAXBXgZI9Ebipp3mRS5SQfJrD3CU+BC6iuxc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlRawXf4NxgPuNc27BRRMeeYAsq91T3xFrx6
 mH5GHww43yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UQAKCRDRgEFAKaOo
 NlEKD/4pEwFKMwkuzppebMT8GxS4/BapFxMqkn65Z5tD/Ufktw0pUTwZvxBqsItY1JdM0Q4C+v3
 XHfIPpuKp5xTbbUOdt4SBecDItB9QsG4XrO6txXAdJhDCojlj35TOpgSagxOszYrZtXZdzagD87
 IWhlxtxDSZNWJuErTM3BTxUus9helPb2gB69Mz7gRBMYR0i9kYdrCLpzHgNI9xVx+W2BCPcvp2/
 A/80sie+JaCkAd0ZvYMB+TcP562EHw4wws9Oo5WPds2HAsHkjvPyQirdek4D0WcIOi1ljmIx7u/
 3Q8D2s6uqwUdrxF6nQpJBMvw5Tmqai+ufyUCIc3RVVerBTAO95wWEfPo9vX01fH4lPejtHr1FoP
 +ETaJdB8EuDJBzbXRa/lVZYAXw0Z+b1l77AU68h7tWjDQqVPLE1TiYaqzKk1IfvbFyE47t6YKc3
 z4F7axpls/TYnnhLkB6gDi2pgx0sXUf9wyHPHYRsC2fz5BZzjkNVtGV31v6fMsR/2Kr0wm3/Tc6
 VYowP0RtBUsKKqX8fkcEa8adh1tZ1wpxE80lvt+a/m3VpOccVSO9ye/UBqpaAVllRTA8Zh4YB9n
 mBBzECUPsQq+66mHj2pZViBHsrF5oukDs7EEQL0IBpqVp25BNvSCLSW5bggYkBq2RLJNYZjQUXX
 tuFmuQtWJFU0ROQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8313

This is useful to open the output always at the same location.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index b377777ed..7f3ba3680 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -185,6 +185,10 @@ main ()
     --env BUILDDIR="_build/$orig_image-$image_sha"
   )
 
+  # Create a symlink pointing to the latest build output
+  mkdir -p "$DOCS_DIR"/documentation/_build
+  ln -snf "$orig_image-$image_sha" "$DOCS_DIR"/documentation/_build/latest
+
   if [ "$(basename "$OCI")" = "docker" ]; then
     args_run+=(
       --user="$(id -u)":"$(id -g)"

-- 
2.51.0


