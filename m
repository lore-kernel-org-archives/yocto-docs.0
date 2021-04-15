Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.1258.1618510497402067433
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 11:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.100.75
Received: from [127.0.0.1] (80-110-100-75.cgn.dynamic.surfer.at [80.110.100.75])
	(Authenticated sender: foss@0leil.net)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2D6D5FF80A;
	Thu, 15 Apr 2021 18:14:54 +0000 (UTC)
Date: Thu, 15 Apr 2021 18:14:52 +0000
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
Subject: Re: [docs] [PATCH] manuals: simplify colon usage
In-Reply-To: <a45556a5-78f8-1c3e-ae36-335636981efa@bootlin.com>
References: <167613DD803B4636.18329@lists.yoctoproject.org> <c0301119-4642-4f26-ce90-71679c433a40@bootlin.com> <20210415165530.udervizadnby6v6w@qschulz> <a45556a5-78f8-1c3e-ae36-335636981efa@bootlin.com>
Message-ID: <7BD96963-1AFA-4FD8-9805-281EEE50C8C0@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 15, 2021 5:10:04 PM UTC, Michael Opdenacker <michael=2Eopdenacker=
@bootlin=2Ecom> wrote:
>Hi Quentin
>
>On 4/15/21 6:55 PM, Quentin Schulz wrote:
>> On Thu, Apr 15, 2021 at 06:14:33PM +0200, Michael Opdenacker wrote:
>>> On 4/15/21 6:09 PM, Michael Opdenacker wrote:
>>>> - This replaces instances of ": ::" by "::", which
>>>>   generates identical HTML output
>> Could you explain how you did the changes? I'm pretty sure you are not
>> crazy enough to do all those changes by hand :)
>
>
>Yes, I am!
>I was using:
>
>git grep -Ovi ": ::"
>
>This takes at most a few minutes to go through all the matches and
>substitute them all in the same way=2E Actually, when the number of
>changes is still not prohibitive such as here, my personal preference is
>to check each instance before making the substitution (just alternating
>between "n" and "=2E" in vim) to make sure it's not a special case that
>would be different=2E Otherwise, I'd have to inspect each line in the
>generated patch which would be an equivalent effort, wouldn't it?
>

I would craft a command and then check the patch=2E But honestly, I don't =
know if it's any better=2E It's anyway time consuming=2E

>By the way, which remaining occurrences did you find?
>

I used ag -R ":\n\s*::" to find them=2E It'll probably work fine with git =
grep instead of ag=2E Or :%s/:\n\s*::/::/gc in vim I guess?

Cheers,
Quentin
