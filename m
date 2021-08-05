Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.11063.1628180101983046961
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Aug 2021 09:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2E8FC240003;
	Thu,  5 Aug 2021 16:14:58 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: Document Yocto config items (was: Configure command shell idle timeout default?)
To: Joseph Reynolds <jrey@linux.ibm.com>,
 yocto-security@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1b70ecb4-d1c7-c913-6e84-d70d69baaa7c@linux.ibm.com>
 <3a45d0f8b91c750544e232171c0b8a650ead3889.camel@linuxfoundation.org>
 <298b3fc4-64f7-c70f-4ec6-e9e52ec71a86@kernel.crashing.org>
 <4e7ff3e4-3dca-d140-51b4-340f16fe66a3@linux.ibm.com>
 <7e70596bee4e54bbaf0ab6da36f41957c19a8673.camel@linuxfoundation.org>
 <0acd3699-0c59-79ec-a690-957e6db94ee6@linux.ibm.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <017b5f51-ecd1-fe77-d76a-9a01f909bbb0@bootlin.com>
Date: Thu, 5 Aug 2021 18:14:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0acd3699-0c59-79ec-a690-957e6db94ee6@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Joseph,

On 8/4/21 10:35 PM, Joseph Reynolds wrote:
> On 8/4/21 11:00 AM, Richard Purdie wrote:
>
> ...snip...
>>> I've tried to push
>>> https://github.com/openbmc/openbmc/wiki/Configuration-guide into
>>> https://github.com/openbmc/docs, but there was not enough interest. And
>>> yet questions come up regularly in the project's email list which
>>> can be
>>> answered by providing a link to the configuration guide.  So I know a
>>> configuration guide is useful.
>> Yocto Project has extensive docs:
>>
>> http://docs.yoctoproject.org/
>
>
> Please note the security configuration guides are generally applicable
> to everyone, but is focused on the needs of higher-security
> applications such as those involving human safety, or processing
> personal or financial information.
>
> I suggest two new sections: one for the system integrator who build
> the image, and one for the system admin (or initial user) who uses the
> system which contains the image.
>
>
> 1. Bitbake configuration.
>
> WHERE TO PUT THE INFO: New section under
> Yocto Project Development Tasks Manual > 3. Common Tasks > 3.2.
> Customizing Images or 3.18 Making Images More Secure
> called: "Security Configuration Items"
>
> DRAFT TEXT: Yocto comes pre-configured with security in mind.  For
> higher security applications, you should review the following security
> configuration items, adapt them to meet your needs, and test if they
> are effective.
>
> TODO: insert items here...adapt from downstream project
> https://github.com/openbmc/openbmc/wiki/Configuration-guide#build-configuration
>
>
>
> 2. Admin user configuration.
>
> WHERE TO PUT THE INFO: Does Yocto have a configuration guide for the
> initial user or system admin?  These are often not needed in consumer
> electronics, but are expected in high-end computers.  I understand
> this topic is very broad and varies by use case, and I only propose
> one specific use case: A list of security items the admin can configure.
>
> I believe this task is for the development team, so it could be added
> to the
> Yocto Project Development Tasks Manual > 3. Common Tasks >
>
> This is akin to the following in that it is something you do with the
> installed image:
> - Yocto Project Profiling and Tracing Manual"
> - Common Tasks > 3.29 Performing Automated Runtime Testing
>
> New section called "Security Configuration Guide".
>
> DRAFT TEXT: Consider producing a configuration guide for your users
> who need to operate the system in a secure manner.  This guide should
> describe all the controls they can operate which affect the security
> of the system.  Common items from the default Yocto configuration are
> given below.  You should customize these according to how you
> customized your image (see Common Tasks > Customizing Images), make
> the advice relevant to your users, and ensure your users have access
> to your guide.
>
> TODO: insert items here...adapt from downstream project
> https://github.com/openbmc/openbmc/wiki/Configuration-guide#admin-configuration
>
>> from
>>
>> http://git.yoctoproject.org/cgit.cgi/yocto-docs
>>
>> and I'd love to see a security section added to these where we could
>> start to collect
>> best practises. Would you be interested in sending something for our
>> docs on that
>> subject?
>
> Yes, I can work with the Yocto writers to get this started.  (Hi
> Michael!)
>
> I've proposed two new sections above.  If it seems okay-ish, I can
> start the list of items.  But please note my previous focus was on the
> items which the OpenBMC projects adds to Yocto, and I don't have a lot
> if items here.  I plan to contribute items I know about, but need help
> here.
>
> Thank you!
>
> - Joseph
>
>>
>> Yocto Project does have people helping collate and edit the
>> information if someone
>> is able to write out the "bare bones" information for them (cc'd
>> Michael).
>>
>> Cheers,
>>
>> Richard


Many for your suggestions !
I'm copying our docs mailing list so that this topic gets tracked
properly and other people can contribute.

I should be able to get back to you next week.

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

