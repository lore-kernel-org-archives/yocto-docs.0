Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.33778.1615196788795477945
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Mar 2021 01:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-29-64-229-255-220.dsl.bell.ca ([64.229.255.220]:34040 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lJCT5-0000uc-6l
	for docs@lists.yoctoproject.org; Mon, 08 Mar 2021 04:46:27 -0500
Date: Mon, 8 Mar 2021 04:46:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: more musings about bitbake user manual
Message-ID: <821fea94-afb1-e781-eaf-30efb94d2812@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  curious about others' thoughts on the following. in BB user manual,
there is an example of overrides (which, ironically, i'm pretty sure i
added once upon a time) that presents a real-life example of
overrides:

"The following lines from the recipe file first set the kernel branch
variable KBRANCH to a default value, then conditionally override that
value based on the architecture of the build:

KBRANCH = "standard/base"
KBRANCH_qemuarm = "standard/arm-versatile-926ejs"
KBRANCH_qemumips = "standard/mti-malta32"
... snip ...

  it occurs that the wording above might mislead readers to believe
that the default value of KBRANCH must be set first, and conditional
overrides are required to *follow* that, when i'm pretty sure that's
not the case. so assuming i'm right (seems that way from simple
testing), is it worth adding a note to emphasize that ordering in the
above is not relevant?

  also, just below that, more annoying pedantry ... an example i think
i might have added as well way back when:

KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"

i recall using this very example in a course, and a student
immediately noticed that the last two lines were override-style
assignments with exactly the same value, and was there a way to
combine them in a single override-style assignment? i said no, it
doesn't work that way, i just want to make sure there wasn't some
clever new feature for that. and as long as my understanding is
correct, perhaps that's also worth another note in case a reader is
wondering the same thing.

  thoughts?

rday
