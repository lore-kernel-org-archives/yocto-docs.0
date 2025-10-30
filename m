Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6270CCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:51:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.4272.1761846687677901780
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 10:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=IynV+DmI;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6WWo//2QUDXJNSyE7U7T5jJ+H+COI2eGz5jD2HS3T94=; b=IynV+DmIG2Nnc5XrO3e1rtfzyU
	BarJh72DGNowfIeKx0y4bsSsOzVrNUTkaNky4iRg8OlxNcJ/xbIt1372DYhS7rFFcR7FwZs3myNHh
	3GQos5QpuyWEpxv3oTfXdYKN4Y7cwZoXUB5OUz/nwVxgm4F2EZXn/7/2O4t+EbtPR1uKp0u4kmBZM
	Hc9kjBj2Q6gBcmJgMjNs4NsLSPPbihit1aZj3rDay27k8pUIRUFquCoKw+GE2CgFPDyMq5acve66W
	07gwsti1vox99W04V61sLYux/GMDe4I9QHATm5523f54565erlywYHKAvXmeiVo007/1olS+wGJaX
	GHKPfOPA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34754 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEWnw-000000030FJ-2Gg7;
	Thu, 30 Oct 2025 13:51:25 -0400
Date: Thu, 30 Oct 2025 13:54:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is there any point covering versioning of pre-release
 packages?
In-Reply-To: <CAMKF1sotO=Z_uT5PdDrO=xtwFKabGiNzf2VcR+qL-4_7HJn=sA@mail.gmail.com>
Message-ID: <5e51d79a-4ba3-4d4c-e4b8-2047bb0ad530@crashcourse.ca>
References: <e68572a2-7c31-403d-caeb-a5a4abc9d9cb@crashcourse.ca> <CAMKF1sotO=Z_uT5PdDrO=xtwFKabGiNzf2VcR+qL-4_7HJn=sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-407212233-1761846862=:90698"
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
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 17:51:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7933

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-407212233-1761846862=:90698
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 30 Oct 2025, Khem Raj wrote:

>
> On Thu, Oct 30, 2025 at 7:54 AM Robert P. J. Day via lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
>
>         here:
>
>       https://docs.yoctoproject.org/dev-manual/new-recipe.html#properly-versioning-pre-release-recipes
>
>       there's a discussion of using that "~rc1" approach to versioning
>       pre-release packages, but the one example shown there:
>
>         irssi_0.8.16-rc1.bb
>
>       doesn't even use that anymore, and in all the layers i have checked
>       out, i can see a single example in the rpi layer:
>
>         linux-firmware-rpidistro_git.bb:PV = "20240709-2~bpo12+1+rpt3"
>
>       that same irssi example is mentioned here as well:
>
>       https://docs.yoctoproject.org/dev-manual/new-recipe.html#storing-and-naming-the-recipe
>
>       but that technique seems incredibly infrequent. is it still worth
>       covering? it just seems to break up the flow of that chapter to
>       discuss something the average developer may never, ever see.
>
>
> It should be good to cover since it is on the lines of semver format
> maybe we should recommend that more but guidelines for prereleases
> is good to have 
>
> It’s possible that other private layers are using it and having
> consistency is good for such 

  i *sort of * agree with you but i'm currently reviewing the entire
"Writing a New Recipe" section:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#

and, IMNHSO, that whole section could use a good gutting -- there is
simply too much information there (much of it addressing obscure,
corner cases like this) that dramatically breaks up the flow.

  first, i loathe the title -- "Writing a New Recipe" -- since almost
the entire section is explaining how recipes *work* and how they are
processed. that has nothing to do with "writing" a "new" recipe. it
would make more sense to have much of the same material in something
called, "The Standard YP Recipe Workflow", which simply *explains* a
lot of that stuff in a smooth, orderly fashion. and once all that is
done, one might say, "now that you understand the fundamental concepts
of how recipes work, here are the typical steps you would do to create
a brand new recipe."

  to me, that makes much more sense, as you have two phases:

  1) explain stuff
  2) now that you understand that stuff, let's put it to use

and as i said, i think that section keeps breaking up the flow by
wandering off into the weeds addressing things that 90% of developers
won't need to know. at least not immediately.

  more pedantic whining coming shortly.

rday
--8323329-407212233-1761846862=:90698--

