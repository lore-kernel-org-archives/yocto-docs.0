Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823DFCCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 14:57:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.14001.1761663442823914634
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 07:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=JOxePw7f;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ucGeq5fmcwOIOsIYmpmJgTDzJxRnp/mIAO31MJg9xNc=; b=JOxePw7fxhQ0CV7aLXOcLsO/yc
	Qy7afmEWvgMRcw2m7/WzUxp1awk21TPU7Pl+RNfncm0+Ktc9I3ZnC3/seCk9CV61hnTY8pCb207ry
	95ulu1XVQWMwW7kPqBC5cpEr62iDBDgEmm/92XwPfvfJQtoNybvYHJGbszSG0v6qRaz1VprKMQt6Y
	ufi7uLqs+aDfG8ouAaIWSEZjkGVxjl3suGdBlzFWNsi5m1nKkGFC7M4H5Ikl5OMPDY8t0Y074z8SF
	Yq6HdoGEG4N/qpZ1iS4Thb9/kEVR334+MnfWgN6VgexoMHBib+Ys4qEd2jKd2BsMhwqcEcIKIealb
	wkBelE3Q==;
Received: from [147.129.179.166] (port=38362 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDl8Q-0000000D3Pm-3sUI
	for docs@lists.yoctoproject.org;
	Tue, 28 Oct 2025 10:57:21 -0400
Date: Tue, 28 Oct 2025 11:00:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: i find the dev manual section "Customizing Images" kind of
 disorganized
Message-ID: <84edca97-ac6c-fbe9-a5c0-5172a996aaae@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 14:57:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7883


  so regarding this section:

https://docs.yoctoproject.org/dev-manual/customizing-images.html

i was trying to figure out why i was so unhappy with that section, and
i think i've figured it out -- it doesn't seem to have a coherent
theme. let me explain.

  start here:

https://docs.yoctoproject.org/dev-manual/customizing-images.html#customizing-images-using-local-conf

the section implies that you will be shown how to customize the image
you're building via the use of your local.conf. ok, fair enough, and
it introduces:

  IMAGE_INSTALL:append ...

this is reasonable and, more importantly, it presents a *selection*
mechanism. by that, i mean that you are not required to create any new
recipes or layers, etc. -- you are simply given the ability to *pick*
what you want in the image you're building. (hold that thought, we
come back to that.)

  however, for completeness, should we also not mention:

  IMAGE_INSTALL:remove

as much as i hate that operation, it seems only fair that it be
covered. so that's it for Section 4.1, which takes us into:

https://docs.yoctoproject.org/dev-manual/customizing-images.html#customizing-images-using-custom-image-features-and-extra-image-features

and gives us [EXTRA_]IMAGE_FEATURES. but hang on ... that feature can
be used in local.conf, so why is it not covered in the previous
section?  again, though, this mechanism is a *selection* tool, as is
IMAGE_INSTALL. so it seems like you could have a single comprehensive
section as to how you can tweak the contents of your image exclusively
with these selection mechanisms.

  and the reason i harp on that is that, once you get here:

https://docs.yoctoproject.org/dev-manual/customizing-images.html#customizing-images-using-custom-bb-files

you're suddenly into *creating* new things, not just selecting them,
and i submit that that takes one into a whole new realm, where the
developer is now creating new layers, or new recipes, and so on. very
different from simple selection.

  it just seems like that section could be massively reorganized to be
more coherent and flow more smoothly.

  thoughts?

rday

