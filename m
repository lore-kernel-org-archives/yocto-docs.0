Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A15CD6E6B
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:45:39 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28512.1780515929131198907
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 12:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=qDU7Axhw;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=hoov/Wtk;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 42A51EC011D;
	Wed,  3 Jun 2026 15:45:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 03 Jun 2026 15:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780515928;
	 x=1780602328; bh=VfqRzjxF/0BLWEUTNikT8CAeo+RBD2FwCg44T/mOFYw=; b=
	qDU7AxhwsThe9YU3beVbnJw68CTnoKZVcHQz3+i271xmiKfeRJh7s54ttzyXKy1q
	vicEL7OJy3TgH/TxmHH+jPoumYjR6dc+Zs+ZmHSLG2q1z0AU6e7y+mvT9OphujKZ
	iXV52cFy6u5PMlEzJfvTanG9cBQMAKI2l2xJ+0Ua82qou7SkS/ZqLKNVO81pwhBN
	4cdjCog9fyUjuMdmlmPLauWBQgGurFyBrvGZeI5/vb++ifn9wy+ta/PocD5L9bl8
	uTRmvHNzFpl+kkzZRd0JwmLS1AFCGGizBqxa0UzeN3BS00GMDpEgUKnP7dCXnTep
	dmLHZ1iVaCpjVaXrK0+Oxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780515928; x=
	1780602328; bh=VfqRzjxF/0BLWEUTNikT8CAeo+RBD2FwCg44T/mOFYw=; b=h
	oov/WtkC0AxTodl0FZuQlAIzqim5jUF2EBiUD8A8wcXE2wjrkDBPRJuomPTx7UTM
	aYDrC6hoAUVgfxeM/haf6WGqKMPDdppPulJegdXOnu0lB8VEs//RK8b5SW6ir/Rt
	SXMa2R5mkCvK8lbczXK1fqv7X3S3FYWZoK8WLux7sY8/DxOn9ylMe7rSQDlQjc4P
	Z0Iq4fFZPUvN8Zb7fYQaPy6r8NK4xuQslMCPFpAS7zw8Lct9h4oXRdj0mJLy//iD
	PWD4RQzBkCsCvdTZywHjmtGEHltq9R7kVrBsv8qA3DF8Omtn3yqzwrruKtiixmja
	8V6z0roPKJT6NQqK8I4/Q==
X-ME-Sender: <xms:WIQganaLe6OE-DzWD-GtJDu7HALMbjJ-P7-dEwnPiM8Z7jQAV8gnEQ>
    <xme:WIQgasYEQlgzrIhm4oT5QIleL78-aTgPGLydQp5EcghGsoNIL8njfwvZ9ae5PGVz-
    H7mSitUAjpoZgCAPWGy5YtYNxtTqifHff62oh9kawsdcIUGrBXU7ck>
X-ME-Received: <xmr:WIQganniNjNBXfm47pkkvWqzAVzssPz27AJvDIfAn0Xa5sTmuOIyMLHcYFS1E9W92vL8FmHzPIS5jP15uZOOjqhQ9p_GauE>
X-ME-Proxy-Cause: dmFkZTEFmFg9DfANNHu6JLYwGPK2uX1QgI2XtauA9cCv90EIVODvD4QCJQPLsRD3YIkSxp
    wr4d+mVlTWlPd5pJAW9dfncNXk1DzvZ7wfVwYT5MXCwL6VV8bzjdfEJQqfRQIweL4jVGoW
    Dzo3jXX6wtW6IBYBnKh7YeD6D2zJN1gA2xFcwjsOidZZobO8a9KGST93C7rb8073DfD50y
    SFm5e+O5fnkKeP818ChblZLtXwEgF+uztOavLViG+zlfw5Dpr2rqYl1tiA0fRTHnEsZ2ii
    4dvTuKRD0692G3M5gheIN5MuD/a7phha42pT4f2t4rBjUJPQMKHNlF756uh3dO5sc4RHjR
    u1lcb1mIr6oaa67jCCZAw2/d45Y6JGQhL+yqY93Y/mOMD77Y6YWXD02W4Wp5XuK54PGwxu
    ZgLvdkx0fGCpvm4/4N5B+maWBRBCqnNmYcEYY9E82JjRjiiXLehOYQqwRDUmNqRhVvK/rE
    gaF0Ik/nbheNb5RYVreJGIuAK2xr+M358XgEdxHNg3MO/vHW/tQJHXKMFejXwKnHUjJPza
    DjC/r9L14uxbjt1drbW6B172Md6RqaybqxxEoMUo/UB8J4Bn9Y5yeI0DeyDEN0rjgSNHK1
    mOgtYwHBd15Je0CPzTLRPyuK1XKAjqauEWclj8mkDACOePo1psDz5TGzranw
X-ME-Proxy: <xmx:WIQgaoxsPfvxJ1-3YZQAhrjFzvF6ndNF3bqmV5u_8n_ZLZdPbcvb3Q>
    <xmx:WIQgalN9g4uNo2RZ6WcHCb9CTUtNUNB66N1GYHp79SM8bh98hYrFQg>
    <xmx:WIQgasTZsKn5BZmXiV6jMFguFjabbZKIqAHrez4XP__RUoIodlLwsQ>
    <xmx:WIQgajaDN7jTNxRIWVXROCp9SanMNtDXUM-8Ock_ZyEqbRj5ib9Bag>
    <xmx:WIQgah_r-TegbL-F5Fi-hqxsNxtKkOJZt0JQwSEusr42zBM1K-BVaXDS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 15:45:27 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 03 Jun 2026 20:45:17 +0100
Subject: [PATCH v2 1/3] security-team: Update membership list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-sec-team-v2-1-ee7d2016fbf4@pbarker.dev>
References: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
In-Reply-To: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=jvYS6J08uR4ZTwRPHrlAbPVuZ2fkQepXsRYZykiEhzs=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQptIStODv15Oq+jYxMSydPWSmdcuPwoQwO+dUuW3vWf
 f0ntiWqvKOUhUGMi0FWTJFlc8/X+097HXkzQm4pwMxhZQIZwsDFKQAT2VLNyDDryMe5RcbyE7MZ
 I9lMLrwP+r+1t+DdscXsS5c5L1r/9MZRRoYvHY5VuhwnRTPSfkjd3/mvvpO74KONccDyKfETZdS
 /+PIAAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 19:45:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9571

Steve Sakoman has retired from the project. The TSC announced the need
for a new security team member and nominated me to join the team [1],
which was then confirmed after the nomination/comments period closed
[2].

[1]: https://lists.openembedded.org/g/openembedded-architecture/message/2352
[2]: https://lists.openembedded.org/g/openembedded-architecture/message/2375

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/security-reference/security-team.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/security-reference/security-team.rst b/documentation/security-reference/security-team.rst
index 30d7b37b2c43..7ec1dda02e0c 100644
--- a/documentation/security-reference/security-team.rst
+++ b/documentation/security-reference/security-team.rst
@@ -107,4 +107,4 @@ information in the subject line.
 
 -  Marta Rybczynska: <marta DOT rybczynska [at] ygreky [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@ygreky.com>`__
 
--  Steve Sakoman: <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__
+-  Paul Barker <paul [at] pbarker [dot] dev> `Public key <https://keys.openpgp.org/search?q=paul@pbarker.dev>`__

-- 
2.43.0


