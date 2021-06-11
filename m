Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.5450.1623397695996454010
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 00:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 09A83240015;
	Fri, 11 Jun 2021 07:48:13 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>
References: <1675A932C413C877.8243@lists.yoctoproject.org>
 <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
 <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
 <168736F45421387B.20336@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
Date: Fri, 11 Jun 2021 09:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <168736F45421387B.20336@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

On 6/10/21 2:03 PM, Michael Opdenacker wrote:
> Hi Nicolas,
>
> On 6/10/21 12:04 PM, Nicolas Dechesne wrote:
>> Can you please push to master-next , so that everyone can see what it
>> looks like without having to rebuild
>> (e.g. http://docs.yoctoproject.org/next/
>> <http://docs.yoctoproject.org/next/> will be updated after you push)? 
>>
>> e.g. i am cc'ding Vineela (release manager) , so that she gets a
>> chance to review.
>
> Done. I couldn't find this URL any more, so I wasn't sure that the
> functionality existed.
>
> Thanks in advance for the reviews,


With these changes visible on http://docs.yoctoproject.org/next/, the
location of the release notes is changing. How much would this break
other resources, such as links on our website? I remember Paul's warning
5 days before Hardknott was released, but I hope we are now far enough
from the next release.

Another question is whether "Release notes" is the right title for these
migration guides, at least in the left menu. Shouldn't we just call them
"Release migration guides" as they truly are, knowing that the true
release notes are on
https://www.yoctoproject.org/software-overview/downloads/?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

