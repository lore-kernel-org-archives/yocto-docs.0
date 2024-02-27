Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD5EC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:24:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.104])
 by mx.groups.io with SMTP id smtpd.web10.10150.1709033050728146333
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 03:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=caRXrXBG;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.104, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQq0SJaPLuqDMo3NDok96clR8JNwQgWbNSqFTHowsyuNdVeFJnJMmdy8zmRw7Ik2iO4zLn9EU6Fa5o8hmwFnC2dDgNlcIMiB2PCJR2v6pTew1i13TzYgl03abE13XFZ+VgY1yAGU6PL7DUJQ+vH0Q5l0/olWpzxHTjJGbc6p1Ut66hesHUl6EJV1CDoJ2h2+E1EAF5sv+7DLDEpnmL4yWzQ07bdHzJqaZrMOXYo2mh1+oKUTek2NsPPYYLAdF4QNZFM8LiD7cSQCmvU6q5sxeXBez055cPL2ElFVAT0MW1NR3l+IYsQK+P9x2UVAIj6iPbvbnaPnZDPhz/EYY+EzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n96XLUe12zGisWWV3rsww3zkVsS7jJmDVhVXQC6LxfY=;
 b=eV1RAMJ9hre5v/VZ0+YppwvD1hUZGzKEBqfu+E8rH5IMt4TlnmeTzxKZFZA3aa0elRZPRcPjCkxKnBTCQJIyij7cGrcjbz9pZbN2avKMLN0Jvcx3RL0cak7IIW3H7Bixvy1iueNk63T4iFgicJ14DGT0LW+n8l8G/7cbinNHvmNU7IbsLVaigLroWPXegTF1bdfvK6o3IEn7/JVzM59k9EftgrGWIXZA1G54WGcQKS7l0ZePmTEyR8ovaVDxE7HcM31w+KcbKnJnm0PlyI/5jT7jFd1XdJTd49Ld2I7cJcIWqYND3kYuSeK4E1nJjmbmogd1brAuqWMWDpH0Y63dyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n96XLUe12zGisWWV3rsww3zkVsS7jJmDVhVXQC6LxfY=;
 b=caRXrXBGi2cI+1zaFmfJ1iPTKz88Sym6oAk2H7K4ffqKL5kJ7oNzDIpCGJ7gIBmEJdUXuHvuaxgX9zu2pWNs2EduR/iwewZCbobbD4ftNOovQfZtmyX/FH3zvRBaejqJkX/JRxWzrWC+T8K41S7Ropo0Ir1wGX4gCYbcChlE58DRPtIJzSGwsFDbTxTPJLZ8YYr3q/XwKCm8DeLZsqR0Kl7yztTNYp4GIztvoT2ehsCDD6fOcgHiKmzsqE4RQw+x7Fby3UscV4ea6e+wV6sC/CX7pZfbmSRsLWJasopD8VzmXFKW3lu/psFa4yyYZ9Tk7DAc+vzsz936OFCWQgorVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8309.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Tue, 27 Feb
 2024 11:24:05 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e%5]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 11:24:05 +0000
Message-ID: <0ea73b57-b0ec-4a29-a0a2-fc16c01b077e@theobroma-systems.com>
Date: Tue, 27 Feb 2024 12:24:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/2] ref-manual: tasks: do_cleanall: recommend
 using '-f fetch' instead
Content-Language: en-US
To: luca.ceresoli@bootlin.com, docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
 <20240227-clean-tasks-notes-v2-1-35fb627e9ca0@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240227-clean-tasks-notes-v2-1-35fb627e9ca0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS4PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 95aa82d8-ff47-4675-1eb8-08dc37869b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uNQBYdbQ/24DuwuCryhg7TwAoU+u/kLpZIJaNWPK7LqgjjVS+J3HxsxxNZYbqimGWgd3zwae3AYgez/89cM5J1WBRHJ4w0aQpYmlPiyPB0r/hIk+YUNEVJNmysv65rbmse2bZkhlDw68NL4Da+845TiCjcMY8KKkDiq+FeO9HPOL640uealhE4Yx8i2r51aHMb/hzbEM1NJO9uOknVmG2ZaCcNMZsz276CUJJm29/gxszmxZu0DyOa6Wqfsq/xXRx6RiNWf5L00RXI3blZlW4CMwfQ71DTawQ2z4RNIiQJ3UhmmIeNl2kbAbkVeum8lXwXrTLIieGT63E9nb5OVM3v9nT64ptFSvm/OPFALUxqsXVfEmjWR8kIwXYTnQ6geuySk5Vy6gygdMTDpuCqj4hRLiwTbdTVADe3ulwwj4gDsSY5yYiuJd6T6YXfGVZt6rGQLPRGikTxPM+LST3jBqRgWQRY9Ek3rwdBcZVw342VmhNBOKr6AurltVCPRO/hn/+2Z2zbeipu2IO8D+ygrnQYmQ6LRyCvajK9Y6MgNOGGztjdVOwxKN1GRZA0WwWcx5xJXEm8Qs1Dusl/xtNd421DG7yEW3U9OgbSBa6rtS3aLRJKSWvAKjAdmdFybwf/ycMX8zux3tO0rFalce3LMBag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230473577357003)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWJBejRHNTRFcEc2WG80UTdDckZ5aXQxdkhCdUIzU0dVYTlzMVNrWVR4NGpx?=
 =?utf-8?B?a0poaUVKRUZqME1xdGtobzRibDlvZlg1cjZoQWpuaGN5UDZLR2QxT2QvSzRj?=
 =?utf-8?B?cGJBeForc043ZG1FY2FVdHQ0M2diWlFjVG1ZdG15ZWNUd3hzZ2xTeVNySmR3?=
 =?utf-8?B?SWZDdDdoSVdMZXdkUEhOS3NYZWRzMU9na2s0cjYxK3B4RFY1L1JLaHhmNGF2?=
 =?utf-8?B?M2FNSnFxbkFzbFQ4cXBLSms0RUp3Z0dHMi9nVk5BNUhaS3Fzc3crMW44YldF?=
 =?utf-8?B?Zm40blJOWGFmL1pidWJSSjdhMTRGbEJHYzN1dmRxUlBBanhIQmxmV24vbHZ5?=
 =?utf-8?B?N3Y0MEw3bmNSRDkvL2NjeCtoREtia1NaVDZtMWZLU0dlYWlQWDJQOGNYQXlZ?=
 =?utf-8?B?ZllXYVhUcjhkSFA1ZmdSa3BkZ2Z4VUNlalp6RDdNZ1ZhTVlZTkYyQ3NHaEpK?=
 =?utf-8?B?UWFaQWo1c0dRTndqUVdxQmdFR29ReGVXUlNUNlRJNjdUMm5lSmhaUlQya2lD?=
 =?utf-8?B?VDZCUUlzdnNPdGwyYXVYaUVkSGF1RnYyK0syallic09uc2E2eFR3WVBBNnlh?=
 =?utf-8?B?VnhMdzVybjdFcEVKVzdtMWZVZHRoMllGN3ZHSkRvYkxXV0ZNU1pZOURDZDBE?=
 =?utf-8?B?OFR1UWVGcHVuUUkxbHg0czBEaWo5aGJBOHNkcmgrVG1RcnBVbVRodjN6UVhm?=
 =?utf-8?B?OUhjZjVCL0tnZmt5ckRwZHlzU0lYL3hlSk5GMGJPaHJUc0RMUVd2T2ZVbGcw?=
 =?utf-8?B?Wm1kYU9xNHpEQmE0MjgyK2J0THJ5TTRCa20wNDFPdC9wZUFDczRYUGFxU1NR?=
 =?utf-8?B?RWtBVDRrWWw5bS9KbFBqTWN6OVM5WStrN21jN24zVzVaTk1wTkJpcnZOTEg3?=
 =?utf-8?B?NlQ3cUtBT3hwT1ZBdGg4enZUbGN0QTlYR1Y1eWtZQXhyY1JRRnBVMFdKanJw?=
 =?utf-8?B?K3ZNWXRvVFdBK25yK1FYaVZISnNIWWExSEdEL0hvQUdneHYxaCtVTGZDc0VR?=
 =?utf-8?B?UmphTllRa0dYVGJEclpUZkhEc3FBU2tpN2V4MTBxUzJHMDdmeVZSR1pkak94?=
 =?utf-8?B?ZERjRWFHQ04vUDdvZzhqMERQUkt3SGN0dGFyNGwzaFNxbVJWbFhhSG5wdW0y?=
 =?utf-8?B?R291MGtGcEtNSmdvcis1enpzWkhpWVZBVkdURjNsMmZMTExLRWtvTStNeDdB?=
 =?utf-8?B?WHMxbkxTc2dzOU82NDFaSk1kWXRJZlR1Y0VhSU4zb0pMeW9lRnZ2WXhjWEk3?=
 =?utf-8?B?eVpRNjJWeWtQS0gwaXU4Zko5c2RBamdmc2ZSTVJhUERuRlh2RHZYQithQkpy?=
 =?utf-8?B?anZrZHZoRzQ5T1oxSVlnNHluaXJWT2FYQlhWN2MwamlVOUFxRUJxeFdsdG9l?=
 =?utf-8?B?NzEyZEZac3E0OE5ZMnMvL1IxMUgwcjhqZUpQWCswYmFNazBISVFEQ1BURFk2?=
 =?utf-8?B?RVhHYXJaWG9pUUFzTHRHVnpDZlVvYkRQYmZ4NnBNMnRIOEg5ZlZmUGhobGdz?=
 =?utf-8?B?OFdERkxFMlhWWmZmQnFRL1pKUVRhVmpIUTYwVTVNVWJwejcxaWdzRDBnRDBz?=
 =?utf-8?B?RmU1QW1oSHBSTktwQlB6ci9nVXBJZ1BEdkhqM3dEYmdpUUJMczBreEFkaWpD?=
 =?utf-8?B?aUM3bEwyQndCWU9Qdzdibi9ZemZtUFcvVVZCOWhDN1laUEt5ZXZTeGp4R3l1?=
 =?utf-8?B?Y2Y0eDVZTW5tMkhDaFFlZUdIYk1MTmpUbklWbkdRSy9Ndld0Wkd2ZkZJdmR0?=
 =?utf-8?B?NVlvMFBZNlJ5R0R6WHovWTBWbDNUcXRwb3U5b2hhUW1OUitYRFJMZDBQWUtB?=
 =?utf-8?B?L0doNEFTdStDNk02R3VLQ3lQcnpLYmVEUk12SkIzeGNtL3cyRDBZcXRmR3F5?=
 =?utf-8?B?Tm9PNXBHV0NESkljMVVGRUdqREtPVEw3MnVCV0xQdUZoNmRUdjE1REh0VkZm?=
 =?utf-8?B?QWswQmdBZjYvQzdjMEs4aC9vMG9JclhHNFdGZlRIcWx4aFlpVVloRHlDYi9F?=
 =?utf-8?B?U3hROTJiTzJEYTZ6dFIwTk40Q1dRa3Rlbit3Vy84YzZQYkxsckNZUlJHdGd2?=
 =?utf-8?B?Qk1sN3BQRUQ0WjlHY2J1VUdFOE0rM25PVFBteUlNY3VtMFVHWUpUMXlnUk84?=
 =?utf-8?B?alFCTldCVzBaMC9YaE0vSUYzemREYmNZSlZZNmxScHhjZFBIMmhUN0VrVW1m?=
 =?utf-8?Q?05RsU5KT26Qzfrtg7ipsfSs=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95aa82d8-ff47-4675-1eb8-08dc37869b9e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 11:24:05.6762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VJAGHx03qB4Ov6SjnaPY6ABzfmyn1bvhkQNet/IHzI9j4QZPMJVDlsbIK3qZkrVlwVFDfMgSYv3AXikvNgqCHHDdk+zqI/IpvfNRxYWJTCR+2+qpJ/l4+/Xk8M9w6FY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8309
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 11:24:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4879

Hi Luca,

On 2/27/24 11:59, Luca Ceresoli via lists.yoctoproject.org wrote:
> [You don't often get email from luca.ceresoli=bootlin.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> do_cleanall can produce failures when used in legitimate cases, wuch as

s/wuch/such/

> with recipe variants (foo and foo-native) or a shared DL_DIR. This is why
> it is forbidden when writing tests that will run on the autobuilders
> (https://docs.yoctoproject.org/test-manual/intro.html?highlight=cleanall#considerations-when-writing-tests).
> 
> Reword the documentation to clearly discourage, provide a safe alternative
> (bitbake -f fecth), and the rationale with an example.

s/fecth/fetch/

I'm pretty sure it should be `bitbake -f -c fetch` as well, from bitbake 
--help:

"""
   -f, --force           Force the specified targets/task to run 
(invalidating
                         any existing stamp file).
   -c CMD, --cmd=CMD     Specify the task to execute. The exact options
                         available depend on the metadata. Some examples 
might
                         be 'compile' or 'populate_sysroot' or 
'listtasks' may
                         give a list of the tasks available.
"""

One of the issues with using -f is that it taints the build as far as I 
remember and you'll get a warning for all subsequent builds until you 
clean stuff?

> 
> Reported-by: Sam Liddicott
> Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   documentation/ref-manual/tasks.rst | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> index 0db960b22f80..ebaa03dc7613 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -470,9 +470,28 @@ You can run this task using BitBake as follows::
> 
>      $ bitbake -c cleanall recipe
> 
> -Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so only
> -if you want to start fresh with the :ref:`ref-tasks-fetch`
> -task.
> +You should never use the :ref:`ref-tasks-cleanall` task in a normal
> +scenario. If you want to start fresh with the :ref:`ref-tasks-fetch` task,

Maybe we could suggest here that if one needs to do this, the recipe 
needs to be fixed so that this isn't needed.

> +use instead::
> +
> +  $ bitbake -f fetch recipe
> +

I think we're missing a -c before fetch

> +.. note::
> +
> +   The reason to prefer ``bitbake -f fetch`` is that the

missing -c before fetch I believe

> +   :ref:`ref-tasks-cleanall` task would break in some cases, such as::
> +
> +      $ bitbake -c fetch    recipe
> +      $ bitbake -c cleanall recipe-native
> +      $ bitbake -c unpack   recipe
> +
> +   because after step 1 there is a stamp file for the
> +   :ref:`ref-tasks-fetch` task of ``recipe``, and it won't be removed at
> +   step 2 because step 2 uses a different work dirctory. So the unpack task

s/dirctory/directory/

I completely glossed over cleanall being for recipe-native in the 
example and was wondering why it would be in a different work directory. 
It'd be nice to specify this is the case because the first and third 
steps are for the target recipe and the second for the native recipe. 
They are in different work directories, and their stamp files are there. 
However, the source code in tarball/git form - if identical between 
target and native recipes - are stored in a directory common to the 
target and native recipes (DL_DIR).

> +   at step 3 will try to extract the downloaded archive and fail as it has
> +   been deleted in step 2.
> +

It's been a few months since I've played with Yocto but I think the 
example above will work just fine?

-c unpack will still go through the task dependencies if they aren't 
done already? I don't really see a usecase for bitbake to NOT do the 
dependencies first?

Might be a very incorrect recollection though :)

> +   This can be even more tricky if using a shared download directory.
> 

It'd be nice to give a link to the documentation about shared download 
directory (if theres' one) or at the very least the variable name.

I think we could also be a bit more explicit about the risks here.

If a download directory (DL_DIR) is shared between different bitbake 
running at the same time (e.g. multiple bitbakes on the same machine, or 
spread over the network), removing stamps and source tarballs/git repo 
from one bitbake would likely break the other bitbakes trying to get the 
source from the common place that now doesn't exist anymore.

Cheers,
Quentin

