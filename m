Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27E8C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:03:53 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1390.1790042626166390246
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nZukbn1R;
 spf=pass (domain: gmail.com, ip: 74.125.230.235, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910c9ff1fso400478485a.2
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042625; x=1790647425; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9+R1qCk7bRlwRhQPdk4+7/nqVppMLN0I0G9R1rvH9ok=;
        b=nZukbn1RU9V192oq4jr4SPNybyghAEJ0D/xtSV5HuQh7SQ6EWySGI38T6JVTJVeIFr
         7+YxWYEmquPCfbfrZfbXvLPfsRA2Zkq5LbbHttH30Mek6OloiE5uxGCGmyGlZUYcXAiU
         6bsNcL4mDCME0LYJmdlbW5jzNzwG92SPDVuYqGs6wp/DkORn9NSXWePhVVbhITj2NyVh
         k5k0uqXES3W9/7eYbuH2AH3KhYC8grMEi0jBv+2+2HLe4GnmKdOFKaAO1XOXtEDWo3nf
         Kwj0SvVb4JyxhDFLa3Z5jzUsIjKVUhmfWxNrE9xKRa+ESZnnrXptBGm3+j4IWDsF3wDs
         LLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042625; x=1790647425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9+R1qCk7bRlwRhQPdk4+7/nqVppMLN0I0G9R1rvH9ok=;
        b=yHlxHPk8JfMwPX2Zo/k70vdtjmOWHQ4WKjHvytZM3vytaPzNRDFoMnx1YdOhB+T5FH
         fbrsMAs4SQDJq5B+eEim4xW77EJ/ZpDpITNiPuzA9cFmcdz7hwVsEkW1Y5UZ45ZrWe2U
         um6rf/vathM/Ld2qvgtNUBeaiK9ZSrF3UuazVjs2tMeWNhodqxVLC7HUl9138nWoIUpB
         X6qZgddTJ26MEmlJHHekJI6BnsjkoEkW6rHGgzAz3ihLdrhPLYIqMliFgUo7ctOuPtU3
         4dXWC969PokBeBwNyX/VfVbqFxHfqnRsENqkWvUKHGHfiui5snFxl2ThxIo53iC6phAb
         QOgg==
X-Gm-Message-State: AFuF++l0lVtTNwfsSc5UMTEC1tPliFr3cGt3F/byfFdpug/VqcpUyjzW
	Zmq0NcQEaRX2OHBbyfK8DugDazuuWqgLBhu+vjS+lnXRsI5oGuMMiyk2mzIKZQ==
X-Gm-Gg: AYBFou34h5+GN892GGoL7L1P8CSrkjmMVXpqxLNCGlReZT2GjTVAM8zuGrW0vSU3RN9
	OLIV96POsQcjmsOLNCiQZwvQDzEy6sDdP55CuO+nq1sGRPBeRhGQbePscGyfVEMBkqoVF+HwQRT
	rE64lKZtjtSpv75FDcnv7NN88dn5rDwJhB4Sc0BxOr49NYemcv4Iws6IfAsoXPXaei4MztO6ljt
	gtUHv8wu6kdSGFaNSLjNiuX01kZq1iIHVPzhe54J0qdBOopTzR/K6qIQazxlkGIucZrELdig7sl
	SU33thl+hD8M2lrFAiiw5tMW2QACRDMRUqtLmaRRiyPzcVReO75tx+xfzjfEFzd6jSzJwXeyg5F
	PPJF8eevckMsMi29lyC60tiollwpz5GpQULHdJzhHYJePHUqeTLmoJmJikb3c5+oBCtPo3Bw7AW
	h+qhlNvuWbxNTBx9JCG1znFJ3+L7OlNofFKXERuNbhWPXorYf30pxloM//bU5Gi5MYO9ieAXFfH
	SzUITNKkMPdnhTvRmIMerk6wQm062mO7TprkA8425WDhA23coQ=
X-Received: by 2002:a05:620a:4508:b0:932:ddff:123d with SMTP id af79cd13be357-93c15da20dfmr360118585a.29.1790042625069;
        Mon, 21 Sep 2026 19:03:45 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.03.43
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:03:44 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 01/10] docs: give the root prompts a preamble
Date: Mon, 21 Sep 2026 22:03:30 -0400
Message-ID: <20260922020339.481929-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10560

A bare "#" starting a line is a root prompt, a comment and a line of
program output all at once, and nothing can tell them apart. Most root
prompts in the manuals already carry a preamble naming the machine, and
the stragglers are what make the distinction unreliable.

Add the preamble the others already use, taking the machine name from
the surrounding text.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
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
index dc34fa36c487..e6c82b9b3c79 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1801,7 +1801,7 @@ probe, you'd just install SystemTap on the system you want to probe,
 and directly run the probe on that system e.g. assuming the name of the
 file containing the above text is ``trace_open.stp``::
 
-   # stap trace_open.stp
+   root@crownbay:~# stap trace_open.stp
 
 What SystemTap does under the covers to run this probe is 1) parse and
 convert the probe to an equivalent "C" form, 2) compile the "C" form
-- 
2.50.0.173.g8b6f19ccfc3a


