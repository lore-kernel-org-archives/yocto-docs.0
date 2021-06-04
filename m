Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.1989.1622826131677151617
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Jun 2021 10:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 76CD8E0007;
	Fri,  4 Jun 2021 17:02:09 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] a really robust "how to get started with YP" document?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <2cf4a272-2d45-1ce9-3813-8e1bb69cd3c@crashcourse.ca>
 <CAP71WjxjRhHc=pUP7B=DcjAMJ-17HbAbR-aMA7D3AgERO2SYiA@mail.gmail.com>
 <af98db1d-aad3-86e2-55a5-b11d47ae286f@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <037c0e07-ec57-5af6-cf0f-41d759049394@bootlin.com>
Date: Fri, 4 Jun 2021 19:02:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <af98db1d-aad3-86e2-55a5-b11d47ae286f@crashcourse.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Robert,

On 6/1/21 12:51 PM, Robert P. J. Day wrote:
> On Tue, 1 Jun 2021, Nicolas Dechesne wrote:
>
> ... snip ...
>
>> Have you checked:
>> https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html
>>
>> Should we not try to improve this existing document instead?  
>   oh, i'm aware of that page, i still don't think it matches what i'm
> talking about. i'd make one distinction, and that's between what
> someone *must* do to use YP, as opposed to really good workflow
> practice to use after that.
>
>   for example, that page talks about how to make sure you have a
> compatible linux distro. well, sure, but you *have* to do that, you
> don't have a choice. so i'd try to distinguish between:
>
>   1) initial setup *required* to use YP, as opposed to
>   2) subsequent good practice that might take years to learn
>
> i see those as two different topics. i will think more on this.


I tend to agree with your arguments. Indeed, the very existence of this
"What I wish I’d known about Yocto Project" document is a kind of
acknowledgment that the current documentation is not good enough, all
the more as it's the first document the user is exposed to after the
"Quick Build"  one. It's a bit like warning that what follows won't be
sufficient or at least clear enough.

IMHO, if we keep such a document, I believe it would be better placed
close to the end of the list, with a title such as "What to remember and
best practices". Any, your main point remains valid, we should first
make sure that the main manuals are sufficient.

Thanks for proposing this. I hope we can make progress in this direction.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

