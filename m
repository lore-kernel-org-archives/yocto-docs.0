Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.241.1631809835553326653
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 09:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A69B320013;
	Thu, 16 Sep 2021 16:30:32 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com, docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3 3/5] ref-manual: improve "devtool check-upgrade-status" details
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
 <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
 <20210915175842.2998541-4-michael.opdenacker@bootlin.com>
 <CANNYZj_b4jWAW+MRDhmEMHtL9Cqq7jOONPbRT=zF7fkaZA=fVA@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ee4fcf3b-719a-dbbb-d3d7-36deeb286b84@bootlin.com>
Date: Thu, 16 Sep 2021 18:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_b4jWAW+MRDhmEMHtL9Cqq7jOONPbRT=zF7fkaZA=fVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi again Alex,

On 9/15/21 8:37 PM, Alexander Kanavin wrote:
> The functionality overlaps somewhat. 'devtool latest-version' takes a
> single recipe as an argument, but 'devtool check-upgrade-status' takes
> a list of recipes, or nothing (in which case a check for everything
> runs), and prints only the items where there is a new upstream version
> available in a table format. The former is intended when you want to
> see a specific status of something particular, the latter for an
> overall picture.

That's very useful to clarify indeed, so that the users clearly see the
differences between both commands.

In the next message in this thread, I'll share what I tried to write to
merge the extra explanations that both Quentin and you proposed. The
other commits in my branch just had minor fixes, so I don't want to
pollute the list with yet another full iteration.

Thanks again to the reviewers!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

