Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.16524.1630328088225524471
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 05:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37238 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKgoH-00015L-HA; Mon, 30 Aug 2021 08:54:46 -0400
Date: Mon, 30 Aug 2021 08:54:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] what's the standard for em dashes in sphinx for YP docs?
In-Reply-To: <356727d3-c50e-d0df-d758-44c3d257817b@bootlin.com>
Message-ID: <9b9aae5-921e-f6ef-79cd-deaf653c942c@crashcourse.ca>
References: <c81c363-94a9-da8c-4d9f-32ec8415d245@crashcourse.ca> <20210830080327.zasqwk4jz5me24p5@fedora> <b177648e-ff38-f0d9-9548-ea46471513f3@crashcourse.ca> <356727d3-c50e-d0df-d758-44c3d257817b@bootlin.com>
MIME-Version: 1.0
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

On Mon, 30 Aug 2021, Michael Opdenacker wrote:

> Hello,
>
> On 8/30/21 10:12 AM, Robert P. J. Day wrote:
> > On Mon, 30 Aug 2021, Quentin Schulz wrote:
> >
> >> Hi Robert,
> >>
> >> On Sat, Aug 28, 2021 at 12:08:34PM -0400, Robert P. J. Day wrote:
> >>>   i want to play with sentence structure, and in some places, the "em"
> >>> dash is clearly appropriate. apparently, a triple "---" renders nicely
> >>> into a long dash. is that the standard?
> >>>
> >> The only issue I could see with using "em" dashes is that it makes it
> >> harder to grep for them.
> >>
> >> Also, we'll probably forget to enforce this in future patches :)
> >>
> >> I don't have much more to add to the discussion though.
> >   yeah, the instant i used a grep, i realized the worm can i was
> > opening up.
>
>
> Indeed (because of the use of "-" and "=" in styling paragraphs)!
> However, that's still possible to catch unique instances of "---":
> git grep -E "[^-](\-){3}[^-]"
>
> After reading https://www.scribbr.com/language-rules/dashes/, it
> seems to me that proper dashes ("--" for "en dashes" and "---" for
> "em dashes") should still be used in proper documentation.
>
> What would be the drawback of using those? Even if "---" and "--"
> alone are a bit hard to grep, what else would they make harder to
> process?

  i will go with the consensus -- i asked only because there are
always places where one would properly use a comma, and others a
semi-colon, and others an em dash, and so on. (see what i did there?)

rday
