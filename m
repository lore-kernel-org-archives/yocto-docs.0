Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EA2C98307
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:33:06 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2902.1790101976341957919
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PPEUQTvB;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca17so1675091cf.2
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101975; x=1790706775; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KSxdhDynk+zhLv5JyI5YMHRdroXBn5pLsb6Q0FLkwV4=;
        b=PPEUQTvB1B6/y56RQdK/YcztXS8PjjZ4XpwkJ4KL1fvPTwrPHOg/N23SHFIakN4rfp
         g8l2FCazUxhKYoVmTmuA9aonHtFX8skT5RCjpp6koK9fGWzQoJrJg9MtF5DNJsNp/1ib
         b/DjU21UTNCmZn3zgAzKfBz6Z+dnnnYlAtMdLiQjcfGtreX+vgMP+rr/0JgoCnVSA2Xg
         9wr2Cw7KTtRLQwIUc5xifI++EGKFAMfpOkTmli2djYWIpdS7fARInx+cxMB7EFARe0ls
         aHW4zkK4ZRgyzB0MNDuSOyF7Ob8RsDwP2bghKbOlKNGFssBlTz16CIrsO1ul4OmexR1e
         46Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101975; x=1790706775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KSxdhDynk+zhLv5JyI5YMHRdroXBn5pLsb6Q0FLkwV4=;
        b=UrzrGbPZ8zB4XnpjeCDQvubeJAZz4fdqqH+xr5FCmmP+94wshqV2s5sd1IEzkNgpAX
         /QH2bU0Uui86DbjLGl7o0952ElcvuLk/ZoF9PuIqvDlYqFomgOT7AmBidmuu+nDMz1zf
         dnNd5cr68m5OyphRMhf/ZJmnEwANQlDyB92/+u0Ot2sBKF/lW0WsYhFdKBvoZSNbqk7/
         Ol+ycRszo7wP1adX4yDfwGpDyw5vlCdvj6vGUe6KyzXBjsnSbR9rh+oQrNR+H0xbGowF
         mMTrURQAxnPI/3ZR0CTkzxH+n2M8dLziKKSO3P3drBk1OANhqaCxNtkuFuXhm27auPyz
         aUaw==
X-Gm-Message-State: AFuF++kh1e4C9MZW20uErDgyycii5Z4CYZryAHjZHJ/bsZq+CnkjeqNC
	kxVohL6pQlmwgU9usE+UQEer2EE+std2TKVTsbsXC33RE3k4cfkR5Cxiuwot1Q==
X-Gm-Gg: AYBFou3c0VddK2/B5tmnNfm4VtJ5O1A1mtdNabP51thBe1mfSUYlYRjg8ehgZKDUNJ0
	sFdG8r2EPsvNsx9uvu515RXPb+gCgEsxRd+/Z+aQmCG1RxYFuSaD6GX3TaYC+tnL6Dg6enZbYCa
	u0z5lVCSqOeoaVgF909++52akAL5BxjuKQbSmyVpNdd4BjjJKtUQxQTawFyJbVnf/Qy/SB9JK08
	xBc+7Hhi2PMGb7u5BraSXFllGtMsYzmqKYE2S0gB0e5eQ44vX32uKCmQ6u5XLueB9ZxD2HN8nK/
	bVGQZsKQB/zdJSwZm20MBDOYYO4RKja2Y/+azCrUz7Uvh6ATUHI0F9V+lHAqU7Dfbl5es6FcFDr
	F3Vw3u+zr5k9Kr5gAbpkK1glHGV2nhGKh6E6oUSdjK/M1oisHhyCm9rOWwFHiwMJkpUbvmSdvGt
	lVAE8ue76rMh84IvU8Xxbuz4HGQa3f5QMZY5qN1gDTkjyVVQO1RiH7N47bCk+x63eLYZ4gufdgb
	n9ji2aHM+WzipjWxz4egoxpTDs41pojt9KkU3jgt00QCh0stZjJ
X-Received: by 2002:ac8:5cc3:0:b0:532:d191:8926 with SMTP id d75a77b69052e-532eae1bd6dmr5336731cf.53.1790101974958;
        Tue, 22 Sep 2026 11:32:54 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3396f6sm3112821cf.19.2026.09.22.11.32.53
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:32:54 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 1/8] docs: give the root prompts a preamble
Date: Tue, 22 Sep 2026 14:32:42 -0400
Message-ID: <20260922183249.2433345-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922183249.2433345-1-twoerner@gmail.com>
References: <20260922183249.2433345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:33:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10590

A bare "#" starting a line is a root prompt, a comment and a line of
program output all at once, and nothing can tell them apart. Most root
prompts in the manuals already carry a preamble naming the machine, and
the stragglers are what make the distinction unreliable.

Add the preamble the others already use: the machine the surrounding
steps name, or a generic "machine" where they name none.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- rebased on master-next
- the SystemTap example uses a generic root@machine prompt; the two
  kernel-dev ones keep qemux86, which the surrounding steps name
---
 documentation/kernel-dev/common.rst    | 4 ++--
 documentation/profile-manual/usage.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 2a65055e2a44..fe2e42265f9f 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -722,7 +722,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
 
       .. code-block:: none
 
-         # dmesg | less
+         root@qemux86:~# dmesg | less
 
       You should see
       the results of your ``printk`` statements as part of the output
@@ -878,7 +878,7 @@ Section.
 
    .. code-block:: none
 
-      # dmesg | less
+      root@qemux86:~# dmesg | less
 
    You should see the results of your
    ``printk`` statements as part of the output when you scroll down the
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index dc34fa36c487..4efaa6d10fce 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1801,7 +1801,7 @@ probe, you'd just install SystemTap on the system you want to probe,
 and directly run the probe on that system e.g. assuming the name of the
 file containing the above text is ``trace_open.stp``::
 
-   # stap trace_open.stp
+   root@machine:~# stap trace_open.stp
 
 What SystemTap does under the covers to run this probe is 1) parse and
 convert the probe to an equivalent "C" form, 2) compile the "C" form
-- 
2.50.0.173.g8b6f19ccfc3a


