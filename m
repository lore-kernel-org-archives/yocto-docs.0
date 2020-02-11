Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.6796.1581405286881321449
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 23:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JFq9z8as;
 spf=neutral (domain: iki.fi, ip: 66.111.4.29, mailfrom: tanuk@iki.fi)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4FAA8214CE
	for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2020 02:14:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 11 Feb 2020 02:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=3eoxPOvFuV8kpCqjRORsKgJyls4OA8fynD+Dx4mUu
	34=; b=JFq9z8asKjrHUvEQTJ/8gR6ze7X8Kz/hcJlpvOtlvCjy+nAydihDNSYKB
	4/B3iZmj84kkLyBZFD+rLmgMZHYY+mHtfNnvuHKjS969lrFkRHXCzZQl6NF7+aL7
	jYiKy7a2G6McTCeJwAVRqBYdZviWgqO0B96apQDKOfjZgBus3Adr5YpKT1yiECNt
	HVfYkZh9mtCON+VSGTC1F9OsZdMt9FJLUdaYxScauH97xi2+V914w+X0EWTTmCQm
	1VUJKLlOSZPd73v7Mnz1hL6LSaA1QvjfpmwR5O1zNhY0R2ZQPJYHqCEQ0O+ELlI+
	M0SUTbHEBOFJKTJ4DLCg6A3ketmNw==
X-ME-Sender: <xms:ZVRCXtuk-Q06uy2RVfZoPFZ2kpy8TEgOtu-njHRDKG28MFgzkkoJow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedvgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgovfgvgihtqfhnlhihqddqteefjeefqddtgeculd
    ehtddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhep
    vfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrih
    hnpehprghtrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukfhppeduleei
    rddvgeegrdduledurddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:ZVRCXqvocMJkW3epbibO4vmgE6tWj5otNwUieandJwpjDeofnaXsTg>
    <xmx:ZVRCXryfa8SQpdR0g5-l3Tpmu-pubVOUqIJaKD8dAoRy_p8-SoXsKg>
    <xmx:ZVRCXoj0pKuPrUeIhtVSuXsu0Dg7CeQgsegido24iVWZs5omM_mDhg>
    <xmx:ZVRCXkZ-qtkQHSLcgZO9dmlw4lYFGn9kr3XIlABHGD9NU6Qf-BBMQw>
Received: from laptop (unknown [196.244.191.106])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9AA243280062
	for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2020 02:14:44 -0500 (EST)
Message-ID: <21fb56c27c2d205338a89b29246a2fe9edf82f7f.camel@iki.fi>
Subject: Re: [docs] [PATCH] README: A couple of updates due to recent changes
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: docs@lists.yoctoproject.org
Date: Tue, 11 Feb 2020 09:14:41 +0200
In-Reply-To: <3e3671e6-02fb-7560-d886-a515122757ac@gmail.com>
References: <20200210033743.24295-1-tanuk@iki.fi>
	 <f2b93c68-e11f-0007-f2e9-1cb5403461d0@gmail.com>
	 <5d6c5c4a1eab46639d88912056a59f13@XBOX03.axis.com>
	 <425c5b7a-f1a6-0c5f-0e5c-77eef392f681@gmail.com>
	 <282e466e0097401e86157215fe3fb883@XBOX03.axis.com>
	 <3e3671e6-02fb-7560-d886-a515122757ac@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-10 at 18:07 -0800, akuster wrote:
> 
> On 2/10/20 5:57 PM, Peter Kjellerstedt wrote:
> > Are you thinking of the layers in meta-openembedded? There it makes
> > sense since many layers share one mailing list. However, here we are
> > talking about the docs repository with its own mailing list. There
> > should be no other patches sent to it than those that are intended for
> > the docs repository, so there should be no need to add an extra
> > [yocto-docs] prefix.
> > 
> I agree. no need to include [yocto-docs] in the subject line.
> 
> I mean "git sent-email -1 -M --subject-prefix=PATCH --to
> docs@lists.yoctoproject.org"
> 
> don't we want a subject? the subject part was removed from the README.

If the --subject-prefix option is not set, then git send-email will by
default generate a subject containing a "[PATCH]" prefix plus the
commit title. This patch was submitted without the --subject-prefix
option, and as you can see, the subject is fine.

I forgot to add Signed-off-by to the patch, I'll resend it.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

