Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D55C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 08:38:39 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25710.1786351112665869798
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Aug 2026 01:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=isUFDSHu;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=CrRnGQiM;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 587E31D00187;
	Mon, 10 Aug 2026 04:38:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 10 Aug 2026 04:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1786351111; x=1786437511; bh=T6
	fCkwwGWWoGpkMIEodjgSuio8hL3TrMLvgCDw8LPRU=; b=isUFDSHulcSGLzUKVD
	k22xTz/1+GUMG/bLoVL5KOwQGOn3/OgJVbptuS0zE5Q7iqMAr7QrAGJcPgG+u3Ky
	NSmUxigLzV7Xr+jpc6XeGgkr4RtFhlPbgqW0CU1yQmsEM3jkaw6y2AEbq+T144Pk
	n9YZJ/7KbdgpLQcOAjl8Ygv1RsuOdjjUEkkgMpvT8dhA5KTRhy4rIF0yGtDGBTQt
	DfI3hKj3esC0Bz/+Aq2jFXvPmYDexeRqyHnvvF3+jatOR1mV2B9tfEC+cd5ZdEU4
	m1r3cra+uUgJ/PExnrVUjZYNs1easvan5Z16iQwGTRhG8lzD109lMYb9DxZF4rgs
	5vHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1786351111; x=1786437511; bh=T6fCkwwGWWoGpkMIEodjgSuio8hL
	3TrMLvgCDw8LPRU=; b=CrRnGQiMHkO3lMI4uTEF4ChmPaswuGwx+ibpvHtRlVO9
	7U4R8ISP0EMKzk0Beeci0bDopMSG9qlDJrSoeCsV5ADLwZufwxMjPgE/kgRYUepo
	wYFYFqQaD8uy+HYniJDIKiQ8mX+bl4qo78iE5TJkXRxlCQ3NT5YotNJirRVQdSwa
	VAzy8ErLzjmEdamLSUQ9xVMKkvcYz4v4DLzFemuUlrCYgLCIZEG3JXoGkRGCqTER
	jh5XoD+p3dgkLxX4HXcToS7U/GoUreGg8mitP0kFxMu4qYZz4YdBgLPIPKg5Z534
	2WtyYApUv84c5GIVySF7LNvcpzc/wLO/T6bCCg3PvQ==
X-ME-Sender: <xms:B455amdMFz7t443EqRb7FWP-pCokWIPLUwxq6RnUmvSd1kP3bJLSAg>
    <xme:B455anoJVtHap3Pe-tyyMTgp2z6Wr-J-JQLlILyS1CL4rQlj-9g7cCMsFeNRe-lTc
    cp66MAylBnmGnN2gjLR0EhjK2ydapX2YwRzxJIWqqeqn5TOHIJy_MCe>
X-ME-Received: <xmr:B455ak6tGyuebxZ1Sm71bmg65MgRDvpUp3jXpvSKe--ah1U-PR4Axzd-MVCBbE9s14qCwgn2nQMCloxO5mDnbaVhZe2wiBU>
X-ME-Proxy-Cause: dmFkZTEcHuI1XJRUkTlV8y+ICXHYSMpVj7w9GVVbot4s4a1AEig2fj2ljORFd5AvWJiCLX
    Oi+q/N/SHOH9wMvH967917rCr9A7kgBdbfTvmVISOvI5cmYKT3gOEUYs1stV30KG+hVlW4
    yrjXmmwnaptI8J39Q9X9KKAoyLf8TfS9VxQbTrie8kuok/I4Gkx/G1UTd167ZH2GiiFeWR
    SVNcuSW9BMEdjUMIeD4FHF1TyGaQaydF4UAes64M1gk4Vbe/IRH1qAzf+KHZcnV/iQK9dY
    06bUzKGSy8GWHFvyjhLb822w5+SOUjwUhJE3X0/IMtSPjUqkjXsxPYuuPUvTK2jvKfguXh
    BP+YofPhKZ5ltVCBMpuoeHHRHoINvQA1qUZXZIKOD2dYwSKz/k8DpkN3smyy00fCv6cHX5
    h881nWAvZnGZiUiPc1RzPZx8gkBIHXq/2hFDs9uFzlNPK8KE6dKVPnfSDUCp/h/nWG/iPV
    ZR1XENjBs3LEbFBlgNlaX19JppnnMuV0aZdy1O4iGK2NE3yRJDnNqjT0uXuHHhAdqCZrie
    nv/17HIwR+Q1jZ7kuSqlltsCn7pdAw8nzp2RucE3vw+kyeYtjh2NO4f2IC5QFQv/sAI2oJ
    1+zAGgflHHQA3gkbA6mPcYK4McHr7uqXgaggYqFOJg8h69MpbijZxkKsIQkw
X-ME-Proxy: <xmx:B455atphL4mrzMvn6SCxSQcLaT3B38Dh32hUTAYa32QRvymjSVPI_Q>
    <xmx:B455amgBcKYOpYVAch8Q18KF9Hsew99TdUamjx1Oag2B3V5pcHKWyw>
    <xmx:B455anKKZQUtCf0BDlBLY_pWZRDdZAsTP_HatKXnLbh9ZbwRfijNQQ>
    <xmx:B455amBoiXGbp6er4C4Fag-_igWlV1hmVuXuelMCfbENmT2_DbYDJw>
    <xmx:B455asxSIfYnSNVq2F_mBi91m4Go1ctZa5JxaPi2xcTF3TVHvWHcdMaV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Aug 2026 04:38:30 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 10 Aug 2026 09:38:15 +0100
Subject: [PATCH] contributor-guide: Note patch complexity requirements for
 stable branches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-stable-patch-complexity-v1-1-f192d51f6311@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAPeNeWoC/yXMQQ6CMBBA0auQWTtJi0iIVzEuynQKQxCaTjUYw
 t2tunyL/3dQTsIK12qHxC9RWZcCe6qARrcMjOKLoTZ1azprULPrZ8boMo1I6yPOvEl+ow3kzrb
 xPjQXKHVMHGT7nW/3v/XZT0z5u4Pj+ABkjSPGewAAAA==
X-Change-ID: 20260810-stable-patch-complexity-1fca314ddf45
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=v62wGwO2VVWzIzritD8yQZ8/NGHoU2NDLQx4ooGSajM=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWRV9jG9r9Z6OdNS/abJ/RPaOyY8q+R6dEnM8Lr2zvtus
 +Yfdp9a2FHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJlJ1k+GcW4O1XeL9lStbi
 U4bvfGyK1vffWbPO6/OHRmN3FgtljwxGhhvSF5IXWGXsZo5wzW8/JLZ/efazS5nXLop6nzsg/D7
 vAjsA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Aug 2026 08:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10246

Expand the existing note section under "Submitting Changes to Stable
Release Branches" to provide guidance on (not) submitting large or
complex changes.

Concerns around the increased size and complexity of patches being
submitted for the stable branches (mostly driven by complex
vulnerabilities found and/or fixed via LLM agents) were discussed with
the stable maintainer and the Yocto Project TSC. This patch reflects the
TSC decision that we should push back on these changes to preserve the
maintainability of our stable branches.

Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/contributor-guide/submit-changes.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index ae7a097ad53b..9974a6b35987 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -671,6 +671,12 @@ page.
 
 .. note::
 
+   Patches submitted for a stable branch need to be isolated changes that are
+   human readable and understandable. Fixes for CVEs or other issues which have
+   a high complexity, consist of a large number of commits and/or a large
+   numbers of changed lines are unlikely to be accepted due to the difficulty
+   they cause with maintainability and scalability.
+
    Changes will not typically be accepted for branches which are marked as
    End-Of-Life (EOL).
 

---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260810-stable-patch-complexity-1fca314ddf45

Best regards,
--  
Paul Barker


