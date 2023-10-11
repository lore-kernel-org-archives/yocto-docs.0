Return-Path: <arne.schwerdt@elbbits.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02411CD6E44
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:48:20 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
 by mx.groups.io with SMTP id smtpd.web10.12195.1697014090219717397
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 01:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elbbits.com header.s=strato-dkim-0002 header.b=BPWqlw4U;
 dkim=pass header.i=@elbbits.com header.s=strato-dkim-0003 header.b=fp3oGyhD;
 spf=none, err=permanent DNS error (domain: elbbits.com, ip: 81.169.146.160, mailfrom: arne.schwerdt@elbbits.com)
ARC-Seal: i=1; a=rsa-sha256; t=1697014088; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UIFujnkH5M7WbVuLBi8d1Hm8DypXLZ1o3ZVUf6qgpT44iJPKtWbjG/GIN+q7ytR0bM
    B7CzLuFvEF7mBiWauRH9Alo3OxTKGUB5aGRx5ld2YTk9dEUOTYpaMXhxf3jZNNYYICoC
    lmBYRi+ajKfUruzreBh8wTkF5mcUbEwYp0okGGbow5AHGNsi5jEbPjt19zYes4Y596dO
    JDJMNeSdLmr+sVS+AyoDmmybC0xXx7829GzMaXYVgyPl7eiARQLklVqbWLECgan66FVQ
    ZFDWWAFV1J8VEti+SieycNsSG8xJgEXmpvagZOxL5q47GU17qQw3JQCQ05pXcvJAhJdf
    5QSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1697014088;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=36lHdnDpbxHnLYQQ9TFgKwG8lVzqJGbXTkiTXhhAVf0=;
    b=AoYc5inWxvSZDrjr5V5cX/WqXfwCaQuC4ssnX8NEQAazeeeSZqYmcsWxWZcax0oLdu
    fOvJNgOdL3PLMXSfC+FBkCm4820I0BK4APxZMhwKSgeIVIwlwj/2g080OycZvlIV6A5c
    QzdvnJAZqImtZLIIU5mOoaQ6teCDuBA+NpMrxapCJ4JBO0Sqt/lt9S51Fnp+Ybs6KqH3
    UuolfPsyeOrf9IlnL6S7wj5gWLoflEMTHZ695F/9AJkCvVSMDt2c3nqGoa0M7wi0mXgJ
    ShcKxmSPlai7Io9n5cEmQXPW1kyd4YRx6OEzODT0Dt5JgDup+nwINkjyDLD0MH0W9sN6
    UmHA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1697014088;
    s=strato-dkim-0002; d=elbbits.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=36lHdnDpbxHnLYQQ9TFgKwG8lVzqJGbXTkiTXhhAVf0=;
    b=BPWqlw4Uo/H+1TBB/AFTZcFiOQwlgb6qToevNZOA+XgnMc+aqiajMOkBuMaImOhKkb
    OXYOldnoN2USAqPFLCibJVAhBf2GX1q3llaWGrGalIgTJPEa0SexVboPZsbamwuSW7FX
    xWyGvSTZKoCv+WyKn4w6xzBBcBsVI+skdpHKyG5AsWexpg/XxyBpRvwNAUdTXbVMHRD7
    kA2uNKaN6T55f9ymyN+txlz//I6GAND9dLzwGS/kAn8jXOQYsxJBikPWuybwBc1OAgs1
    fRoQQGQyFvkaUAm1coG6gKhbkYl5gL5yAzPqFOOx0xQVk62bogVW9a5R829xcS/5MfXg
    /bmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1697014088;
    s=strato-dkim-0003; d=elbbits.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=36lHdnDpbxHnLYQQ9TFgKwG8lVzqJGbXTkiTXhhAVf0=;
    b=fp3oGyhDyKDWxJdRVztu5yukcQFJ+6C1+1Am/zp5PEMdlQNzM3kbuaSzmyd19McHuI
    0UqUiNcOADfiA6ukShDw==
X-RZG-AUTH: ":LX4KcA67ePdSNNS1lFjg4Kcc95CZ7NUNqa67TO+Ql1rqRbQ8LJprEFOoKig+MNugXZLVijuDBFkRmzYOVQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.8.2 AUTH)
    with ESMTPSA id w04060z9B8m7hnn
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 11 Oct 2023 10:48:07 +0200 (CEST)
From: Arne Schwerdt <arne.schwerdt@elbbits.com>
To: docs@lists.yoctoproject.org
Cc: Arne Schwerdt <arne.schwerdt@elbbits.com>
Subject: [PATCH] ref-manual: Warn about COMPATIBLE_MACHINE skipping native recipes
Date: Wed, 11 Oct 2023 10:48:04 +0200
Message-Id: <20231011084804.154987-1-arne.schwerdt@elbbits.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 08:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4337

---
A recipe inherits from the native.bbclass is always skipped when the COMPATIBLE_MACHINE is set. This behavior has been introduced with daisy (poky/meta/classes/native.bbclass:107). It should be at least mentioned in the documentation.

 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 11523bb9e..a6f7ea03a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1358,6 +1358,12 @@ system and gives an overview of their function and contents.
       speed since the build system skips parsing recipes not compatible
       with the current machine.
 
+      .. note::
+
+         When :term:`COMPATIBLE_MACHINE` is set in a recipe inherits from native, the recipe is always skipped.
+         All native recipes must be entirely target independent and should not rely on :term:`MACHINE`. 
+
+
    :term:`COMPLEMENTARY_GLOB`
       Defines wildcards to match when installing a list of complementary
       packages for all the packages explicitly (or implicitly) installed in
-- 
2.39.2


