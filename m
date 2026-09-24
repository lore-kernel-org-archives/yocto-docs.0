Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A297C98327
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:09 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3761.1790270939747144749
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kKCuMqkt;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso995722e0c.0
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270939; x=1790875739; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9Y+E1zLOrJprCblm/jWdeMBIX9yLHkcy7xQVhGkonk=;
        b=kKCuMqktS+d50CLoHOsS4Kx1WMaEW+2sbicy4+gj1AIGa66Zsa5fn3dscwArKPp48i
         eJMOzXjQUDomldJzp4yeNfqvoX1QFh0ej58Crq9mINjrPjOyGh+SB9f4HGjBgiIQuvxl
         uMo+vQwiPpC+DUXRt5f8YplvdoWDGZdo6CEdfKXh1g7vhmDzyx2t4gwSRN6pXxaDyzWu
         48I8EmT/EMbpwE4p0iyGHpn2MbsCnqEkKvf+xJkJPE5SFkjyBNwsNwNi2HZPDwQLj6F0
         VjRMba8aLF6pA9orkiB9yQBqvCH486ifCmJRK8TV7RImxF0U97kiu1zFe/qIYjxvqb5U
         VnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270939; x=1790875739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9Y+E1zLOrJprCblm/jWdeMBIX9yLHkcy7xQVhGkonk=;
        b=U7n4nPQqTs53RpfvpUtnjGiwoL4qeZB5LBDjeSlr87GLrK8oBl37h+txC8/OpKtLRg
         aeyzBcKHp0H38vl/gahJYxXfsr2qKbeGyWdiv/SFaFS4ie8dZEdbY1ia1btMaAxz89ok
         SVo85wuhq7cyRHKqTvIghUI8f1ooo63TMflkRMMvLtz7tGjbre4yoqtcAKFF+yvR/r97
         gaCTVgE82upfkT1CSTdmkO5+VNahcCVn5cAWDR9K0z6+11YLBITi4m9D7meJ51s8ZqFZ
         CGE8zxUhJ0K9UnKrPS7hspX2JcSvL2i+nqZRVBsEXjNS7GbSsHzodVNHKFuGcoAwL+J5
         r0yg==
X-Gm-Message-State: AFuF++lee47JSGLjuIvFXlmFesjz/Q4NrTXcngXAe34s8x+DBi1ri4Zr
	8a1hZHSHR5Ht3taq/sqd4c+VueY9G2PyzYAtVnn3lvmseF/dkpzU8bwd49lwSw==
X-Gm-Gg: AYBFou0xX27YhY9g8/gm0i6Sc93SbJ8BgVyvZY6JoMF+H1qWU+n0wAD1gR+dxTHQnk8
	OPkS/ptxxzCFP8lwQ+y/Vj9v+UUd4fbngTYHt3w2TQAm0IlrrXGwXCRyq0q3hF3GdLAxmByqABP
	irutePvqTzodIGFr4dx0GZnrpMU+I9tjuwlxWCN2sQSrf80N8/rQYtjL1NfIkSzUyEVWuS0W2yV
	AUG0L7/SUU7t+9/W3gnYGMgfcWCgDEduRppc236J+jssKx0TJS1klNMOEyacsRlhySfziFe3q3Z
	mP2HuVrBh8hjL8J6H5nh9ucArBzkInpCkzUJ9l6kRFQ98s01Rhj8M3SycpO3E4dGnbHdv8X1G1a
	F6Esm66X/ZB17z0dNzDIxtfFPfORK3Vq+SSatiQ0zwmqsZwE338r3Pi2IWaImiQ+UVe92sYsAnP
	+mfgBOmjK+x7P/oFpmd4jEdChDY5Ox/OYjeYVfP/nx1Xq+P/dbCHasjsxtTTDZVACKFUk0PO2Fm
	oeWgIJ62t+nwqtPnDb7bcQB/7Ud+Yi2QssxTEADd9xnWBGsY9Dhr4Fp4XHQeQ==
X-Received: by 2002:a05:6102:3a6e:b0:7a1:f2b5:646d with SMTP id ada2fe7eead31-7af1fc21578mr921125137.42.1790270938638;
        Thu, 24 Sep 2026 10:28:58 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:28:57 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v3 01/10] docs: give the root prompts a preamble
Date: Thu, 24 Sep 2026 13:28:44 -0400
Message-ID: <20260924172853.2665062-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10624

A bare "#" starting a line is a root prompt, a comment, and a line of
program output all at once, and nothing can tell them apart. Most root
prompts in the manuals already carry a preamble naming the machine, and
the stragglers are what make the distinction unreliable.

Add the preamble the others already use: the machine the surrounding
steps name, or a generic "machine" where they name none.

AI-Generated: codex/claude-opus 5 (xhigh)
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- the kernel-dev "make scripts" block is prompted too, with its working
  directory in the second prompt

changes in v2:
- rebased on master-next
- the SystemTap example uses a generic root@machine prompt; the two
  kernel-dev ones keep qemux86, which the surrounding steps name
---
 documentation/kernel-dev/common.rst    | 8 ++++----
 documentation/profile-manual/usage.rst | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 2a65055e2a44..65bd3d0d1f46 100644
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
@@ -1554,8 +1554,8 @@ directory. Next, ``make`` the scripts:
 
 .. code-block:: none
 
-   # cd /usr/src/kernel
-   # make scripts
+   root@machine:~# cd /usr/src/kernel
+   root@machine:/usr/src/kernel# make scripts
 
 Because all SDK image recipes include ``dev-pkgs``, the
 ``kernel-dev`` packages will be installed as part of the SDK image and
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


