Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.16919.1581306078285253951
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 19:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ocL/mp2n;
 spf=neutral (domain: iki.fi, ip: 66.111.4.29, mailfrom: tanuk@iki.fi)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 655AC21F57
	for <docs@lists.yoctoproject.org>; Sun,  9 Feb 2020 22:41:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 09 Feb 2020 22:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=b8yaPgFcP3dOGuUky
	wWk1JAgBpAC9bKKV4vQMv1TS2k=; b=ocL/mp2nirqRqJpzYEYvnidKWo0uVYij6
	kJy03HoFvUaWlGrwHrvstDsQSLWdQwN6gQhUocA6gBBpYFpKC7c1iW+KPR4EMVtf
	zO1tqkVqCRYE4Hfg+WOdQFMl6BkTBo5l+tNlflt+OtqrmNs2ewqVbqi910GvNNLv
	ivfHx/iBxALtIcMhuwz00fMeY+nqW4/X8oYGEuSEukG6o7X4tt/MsLtlBn/HpxOc
	W0G3MZ0OuYsfEckc3AIutMbCiUzzD386ilVzocY9uTuHqpOoNhJCYJoDzqJyXOhd
	5dcFmhnRv8asMk5tixVCq6Y7Vj1Y4t+V8vPssERroAFub8qFTFGNQ==
X-ME-Sender: <xms:3dBAXjpjur8fSe8QYoxgJFrfjeHmlqE42p2yB2k2NLrr5MtIWvWi7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedtgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhi
    qeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecukfhppeduleeird
    dvgeegrdduledurddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:3dBAXslgJXGF-x75tjRrRMvSvQpzU-KjxDEOIDoMzHmT22BDug9SJg>
    <xmx:3dBAXsQ-1XydQQHOWBzo_WMsDEOylkgUZUL_4rQGjCiMsVFb8N58nw>
    <xmx:3dBAXqZBw_L_w8pP8ZKC0q6_lK1biTRaItM_-c-tdPtY4NqMICo9rg>
    <xmx:3dBAXpYBNwQav2rfcYj7wp-1fNv_bi0y6tfYXl0SygM1cNxuNKABCA>
Received: from localhost.localdomain (unknown [196.244.191.106])
	by mail.messagingengine.com (Postfix) with ESMTPA id ADF8F328005A
	for <docs@lists.yoctoproject.org>; Sun,  9 Feb 2020 22:41:16 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: docs@lists.yoctoproject.org
Subject: [PATCH] README: A couple of updates due to recent changes
Date: Mon, 10 Feb 2020 05:37:44 +0200
Message-Id: <20200210033743.24295-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since there's now a separate mailing list for docs, I think the
yocto-docs tag doesn't need to be added to patches any more.

---

 README | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/README b/README
index 62c2a3ffb..6a7f3abe6 100644
--- a/README
+++ b/README
@@ -11,15 +11,13 @@ Where to Send Patches
 =====================
 
 When sending single patches, please using something like:
-'git send-email -1 --to docs@lists.yoctoproject.org --subject-prefix=yocto-docs][PATCH'
+'git send-email -1 --to docs@lists.yoctoproject.org
 
-These values can be set as defaults for this repository:
+The To header can be set as default for this repository:
 
 $ git config sendemail.to docs@lists.yoctoproject.org
-$ git config format.subjectPrefix yocto-docs][PATCH
 
 Now you can just do 'git send-email origin/master' to send all local patches.
 
 Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
 Mailing list: docs@lists.yoctoproject.org
-Please cc: Scott Rifenbark <srifenbark@gmail.com> on changes.
-- 
2.20.1

