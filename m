Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834D3C44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:24:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5185.1783506251425270590
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 03:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NauQEXyK;
 spf=pass (domain: cherry.de, ip: 52.101.65.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5pNcKvS1CUev08qQMCPRWBQwuKN7lumacPVhBksJC4RGWXzKoWIF9GMyktwTAMu9vcRu5051sqdXo4pjQtg0TG7mPOwFH2iPZiCKQ+hZqo7vKhtDSG82DahjrGvmh1F9/c6pyj/L9RORe/in+J3BI1+zDf9Slsqvq8Uu1Qq6kDzI8CGsZTUY36e2y6q1cGjCxodpGNwE1RfXsyXgKXvb2tW7X4Wp7qCSDu8T8zJhJdMdJXMTWRKOsjzm4K3AqW3LOD4g19OP1h0nxnwKGjKvYdjsYu9UnpDxPI1B+fP0BP8viJC5P7+vPKmY7N+CWXoGj0TzwjI0baeUJc0lRym5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81maHtuI3aJBD5o6PcsOhmY5BM7ElOyYH2GiNYNaVTc=;
 b=OhJSCVPwgPGdp4OWi69fcZ6OkBxgJyrP2QRYhHsJBnhy1YOaUWrLz4IXdldoxSXwSI4I5voM8rqrGxAIv+ELcGvAwQlBr0DxrtHA+PIrFF1S5fn1O/PeaiYU0czc1yppBcqnXNdTUozDVl88rfTQ0PZ9LVlr3ARoi1TqQazNjPsMWIeEIJ+UeGBaEYyGRXX+2cQtK6pY+OLrAuf34IEpRAsGkpaRSvQQDi1drgJRN0wygjVFtw1A1fV4XfEif52JL+JNpIZMUMVToAAyPHNDs6CvseXAAJ0uI1ecvo9WCouZkIPVf3VggAPnsM6fK7lVpu3XNwbP14a/44m60qxdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81maHtuI3aJBD5o6PcsOhmY5BM7ElOyYH2GiNYNaVTc=;
 b=NauQEXyK9TECroJaGPTl08S0AP65Xv1s0JC0XBU7CJZ1B4CuGRBRYS6cuDI+5ryvi999SwruBNHY0ylVAsyTA9xTcs2sVuTCe5aRQa937yKib0vIqWZcLe2IVA4v76UN3vqTlMKtdqauGhOeFfze5JTPHRCXR90Ew0hYPiczRxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB10024.eurprd04.prod.outlook.com (2603:10a6:150:117::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 10:24:04 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 10:24:04 +0000
Message-ID: <ebb09a0b-babd-47d7-bbaa-a9d99d95c84a@cherry.de>
Date: Wed, 8 Jul 2026 12:24:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH RFC 0/6] Generate documentation links for OE-Core
 (cover letter only)
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260703-gen-doc-links-v1-0-c2c31c68a0c2@bootlin.com>
 <d7cfcd90-05b0-4694-9b37-8bd7ac5fa029@cherry.de>
 <DJT3RMDK1H4Z.2CCWEJB3VWC1L@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DJT3RMDK1H4Z.2CCWEJB3VWC1L@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB10024:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fb2098-7382-45eb-6d3b-08dedcdb0912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|13003099007|22082099003|18002099003|11063799006|4143699003|56012099006|5023799004|6133799003|3023799007|4133799003;
X-Microsoft-Antispam-Message-Info: 
	iWJBxypuDuQhk88YrbYgyKtMI9HDomjqib7NevZor6sMXSsxhD4pwpBy+yW0gQ9HWqbXcSSMRD3le1R+p4R9Wm8imcHUfdGxP9Wg+Z2y7GHai14ZL1gKXKde50z3/rVwn5YVBwLbZyf6ZNN8qiRyIyY6YXFhZY+k2djlZReLiGz0dgByebtGbBCJMm/K66AyLoIRd7U2BUl9ML12VOrf2w4iL6r2L4YQSUq4ZBUTCc5RYFrvjQYYQxxH850teBt7hvcxuyf5pbUDftWzucK9ydNlgqknrGZqr+JWQMvBBR7Laxpg82Uj7uGpwtf0pi2iMQKgI67GzBGcrqN9/7hi+ZTbMD13v5TYgS6Wh7EHkXF5BDa5lLXumY24sv06zOMFK/bLzfmlhIQ+f5Hsvepy7zl9hznOzVBtoLwPDfh6KqBQUfoFe31h7N1PZFAUn8Fs+9PSbQV5zsHqnnnl3wlRPNRJ0zepi71GPc3YqNCH8mE+8iR3P5oz5H2W45V/WZSmaT7bvNUswUv5c4dsGV9E3ySKJb58no1292sWInaNYI/CXMSVXPiIa7lRCU5a80c27h8ZxRNXI8wTMuyF2aNyOI37UJL8WfowJS2ud6ebcy7pJU2euxQpvFKK0zkq5Lyx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(13003099007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(5023799004)(6133799003)(3023799007)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGJCS1ZYZzRNMGpWOFlPSW1LVGZEVUhIemlLWUFxRHBIMlFtLzFoU1N2djcr?=
 =?utf-8?B?eWVNUEJLRWkxaGdBKzUyRW1hZU90OEpPcmVzdUl4RElGVU9kQnM0ZGZxQzcz?=
 =?utf-8?B?WHBrLytUZmhUdVN1cERSWGp0N1RhaThBWnRIOWlEcTJxbWdaSmFaQ01vVjdY?=
 =?utf-8?B?ZkpRbzhmSkZEVHFRUzZiY1Q2M0dNVllLMy9QbHBsTmVDcm5qeTM1ZFZpNmlC?=
 =?utf-8?B?dFI1RE9LeEZDS2hueGJvcnl2ZG40T1hLNWRIWnVBY0tZallVcGdOK25vK3Z0?=
 =?utf-8?B?VWxCVE5GcWlUVng4QkFpUVNuWkNtNTNvVkROQmFldTFlekNXM2J0VktIZzdU?=
 =?utf-8?B?VktLc0NmS1RyS21KcU11VHRYUzRJOEFheEwwTlV0MmJFRUdHK1hNSFFCSTVv?=
 =?utf-8?B?WEtyV0RHbjE1UVNsVjlja1U0OFVSdzlZTVpYcE8remxyR05DUzdZTG1JbjBz?=
 =?utf-8?B?eGhRU1ppVUtqSDVVdHQ5dUFXUVlteERFMm96cDZIdkJQL3lJL0ZnNDFLTHJN?=
 =?utf-8?B?SWtUZG1VeERVVTZKYllkbXVEY29uTmpHTFVXam13ZVdsVDdoL0NMUEFVOUxQ?=
 =?utf-8?B?amw0TDJzUkpBU3hKcmdHT0pyR0d4NktTdXRwaEdmWUNMelBza01uNjR2WExH?=
 =?utf-8?B?Z1NsRGZLcUxKaDZ4anp1aEl2ZDRHS0ROVGRPTWhudE0vQU5PL2RoaFkrSXMr?=
 =?utf-8?B?TExDQ3U4cmVFbHZydThyeE11ZXZ4cW5ZY2VUUlVhVXpxakRkQ1dWbGg4N0ky?=
 =?utf-8?B?ZVM2RERxRVp3OE9iNnNvRng5eHJrVjFOVWt2SE5rZ21GTysrSzNlN1RZeS8v?=
 =?utf-8?B?VG4zdDlPMHJDekhDRDBsYzFZaGc2d1lNdHNzRUFVUFhpYmlJRDZMRGh1SWxM?=
 =?utf-8?B?bVZpS1c1NURuTnMvYnhGeGdHaHZkekVzekd0MFAwdTlScG9zVVN6L1JCSEFB?=
 =?utf-8?B?UmdBaTJmQnVQUmIyT2lYdGdscy9RU1BGczdjV0Fabk84cFNXcXNGSi9BUXJ4?=
 =?utf-8?B?UjNxQ0cxZ0tuWFYyMytaMEdiZ3VJTEJEcjA1MFdiSVdUTWFaRGV1NkpaNk9O?=
 =?utf-8?B?WnVTRExBWTU1aU5kNGZjTkM2RkoyYm5EakJmOWcrUTQ2NUp5QVpWTGR1cU5q?=
 =?utf-8?B?UXZBMVJva3RSZnAybzFENXdVNlpOWU5sV3NuUStwcHBYcnY0cmpWWjhTdlda?=
 =?utf-8?B?eHgrNCtlcm4vQXAwMDdjK3lvaVlXa3pZcExRcmU4ejBZbGVPK3hza1Exa0pZ?=
 =?utf-8?B?V2REV3VBdDRzRWZmOGJSZGlNdGY4Sk1pdTViVG9KTTdPK24zMTE2ekJlY2U4?=
 =?utf-8?B?V0RKTG8zY2plTW4zakpxZkUxVnZUTWMzQnZjZldKQXNER0FieGpmMk9pZG4z?=
 =?utf-8?B?U25VMGJHdEE0Zm5DZmFPUlg4MjhCZjRCbXBjZ0tPRnlZZmVNeFBNeTJtZWd0?=
 =?utf-8?B?TEdWd2ExOS9CYytuOGR3THZKMmN1VnM0NXgzTFR6aVp6K2FtK0VqVEcvK0g1?=
 =?utf-8?B?UWxYOEU2S2QxNEtpYmQ2NWpWMWhST3VqK0tQRENuT2kycFFmeHg0VEhPVUk5?=
 =?utf-8?B?VWpSUFA4NjZsS0JWZGZtUUN3YmYwaVVHYXU2T0c5anZrR0xjenRLS0QySEN2?=
 =?utf-8?B?NkxROWREekx1WmlEb0k0OHNuaEdSd1pRaWRRTFA5cDFrTVNtTTM1aTZDRmhD?=
 =?utf-8?B?QkpsYk9FdU5kOU43eS9pRWQxSUhSWW9KN2NCTnN1Nmg4MVp6a1h0dVdzSUNK?=
 =?utf-8?B?RkUxaXFFUlNoTkNRSm96bDRtanh3aW9Za1JTOVc2VnkzMmQ5RlJyWXpIZUQv?=
 =?utf-8?B?SHRqc1hpbW5JazVlU012bHE5VWpBeEh0RDhwelQvUzE5b0d6Z0ZuSGxXZWtW?=
 =?utf-8?B?NTU0S2FaVVRKeEp1a3gzNFN2ayt4Y0F3Mm5hNXArZ2xmbGlWVlZTWElCRzl0?=
 =?utf-8?B?ZUpSVFFlaHoxd2RMdXVuTkJQcCtQR0VleHFTR3I5clhFdFdtSWZZSGc0b1hE?=
 =?utf-8?B?eDJzS2YrMjNpQ0ZxcUp4dENBOXk2bVE0ampESWRLNTkxVlpIenpIbDMzNmNz?=
 =?utf-8?B?bGEzQXliNEh4R0FmaytRVTlqK25DL0IzRUlkRkllQVVXd3ozZUQzWHJ4anN5?=
 =?utf-8?B?a3M4SWQ2L3pqNXlHK3dlMFVzQldZY2VBZE1kQmdybmNMYVZHMmVKemRGeVl2?=
 =?utf-8?B?KzhleFFlMW9WRmUvNVNGMlVpN3diYW9ZZ21Hc3ZNSm0rZ0xlYXJwdlR1MW54?=
 =?utf-8?B?aFBNNTFxMDMzSTF3d3FGZWFGLzJnZ0RxQ0ZHNVJHQndtYTNDVTVHMWczY1Zj?=
 =?utf-8?B?M0V3WDJWVUZ4U3R2R214TVNUZ3VtT2pCRzRXcW5ZSzRKVXZhaWlRdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fb2098-7382-45eb-6d3b-08dedcdb0912
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:24:04.2555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PquQxxMwDvNVz8VI1bxDHJbdn8NNrTcHjtUddZbWbtPZeMqk7HpX4BPc/BhUPfmnYJpwnN1iF2HJo6pc9E7EcEUoUm36yd44TrRcoQegK3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10024
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jul 2026 10:24:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10043

Hi Antonin,

On 7/8/26 12:03 PM, Antonin Godard wrote:
> Hi,
> 
> On Mon Jul 6, 2026 at 3:01 PM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 7/3/26 5:07 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> [I have pushed this here for now:
>>>    https://git.yoctoproject.org/yocto-docs/log/?h=contrib/agodard/b4/gen-doc-links
>>>
>>>    Not sent to mailing list as patches are quite big.]
>>>
>>> The purpose of this series is to make links to yocto-docs accessible
>>> from OE-Core through a doclink flag, making the overall documentation
>>> more accessible. This link can be shown with:
>>>
>>>     $ bitbake-getvar do_install --value -f doclink
>>>     https://docs.yoctoproject.org/blacksail/ref-manual/tasks.html#term-do_install
>>>     $ bitbake-getvar S --value -f doclink
>>>     https://docs.yoctoproject.org/blacksail/ref-manual/variables.html#term-S
>>>
>>> This is made possible through a file generated automatically, which
>>> contains assignments such as:
>>>
>>> S[doclink] = 'https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}/ref-manual/variables.html#term-S'
>>> do_install[doclink] = 'https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}/ref-manual/tasks.html#term-do_install'
>>>
>>> This can be used in projects that want to point to documentation, like
>>> Toaster.
>>>
>>> This could also be included automatically from OE-Core's bitbake.conf with:
>>>
>>>     # Default path to yocto-docs, assuming it is next to the openembedded-core
>>>     # repository, as would be provided by bitbake-setup.
>>>     YOCTO_DOCS_DIR ??= "${COREBASE}/../yocto-docs"
>>>
>>>     include ${YOCTO_DOCS_DIR}/documentation/oecore/doclinks.conf
>>>
>>> The main point for this is to make documentation for variables easily
>>> accessible, with the hope that this would also encourage people to
>>> contribute to documentation more as it would create a bridge between
>>> OE-Core and yocto-docs.
>>>
>>> This is more of an idea than anything though, comments on whether you
>>> think this would be useful are welcome!
>>>
>>
>> I've barely looked at it but the first question I had when looking at
>> this was "why a file per variable in the glossary?" and the few commits
>> I had a look at in the RFC branch don't really say. I think you may have
>> wanted to generate a list of variables that are in the glossary and
>> parsing Sphinx is a bit overkill, so just looking for files in a
>> specific directory would be easier? There are three issues with this
>> logic, first, we would need to do this for older releases which is
>> time-consuming and error-prone (I guess you probably wrote a script to
>> do it, so maybe not that much), second, it may become outdated, third,
>> you need access to the docs locally.
>>
>> Have you considering simply getting the objects.inv file generated by
>> Sphinx and available at docs.yoctoproject.org/objects.inv?
>>
>> python -m sphinx.ext.intersphinx https://docs.yoctoproject.org/objects.inv
>>
>> will give you something interesting.
> 
> It looks like a great fit for this indeed. My only concern is that this
> is built after running a Sphinx build. So depending on this file to generate a
> configuration file that we maintain in yocto-docs means we depend on building
> the documentation to generate a source file. This is fine, but originally I had

But the neat part is, you can download this file from the official docs 
so you don't have to build it yourself or require a local copy of the 
tree like this RFC suggests.

> a pre-commit hook that would check whether this doclinks.conf would require
> updating, and now this hook would require the documentation to be built to run.
> 

Ah, I did misunderstand the intent here. I somehow thought doclinks.conf 
was supposed to be part of OE-Core, but I think it would be more 
appropriate this way, don't you think? We can always provide the script 
to generate such file, in case someone wants to generate something based 
on it (like I could imagine some VSCode/vim/emacs plugin that allows a 
click on the variable and open the doc link in a browser or something). 
I'm not sure what's the usecase for third party projects to be able to 
do it though, it'll point to the official docs, where we only document 
variables in OE-Core/BitBake (and maybe other first-party layers, don't 
know).

> Anyway, I did a bit of playing with the inventory and I was able to generate the
> same file (doclinks.conf) using it and sphinx.util.inventory's InventoryFile
> class (the one used internally by the intersphinx extension).
> 
>> With this, you don't need to keep
>> updating your docs and be sure it's up to date, you just download what
>> you need (we have objects.inv for each release I believe), you don't
>> need to migrate any docs release as we already have it (Dunfell has one
>> for example). The downside is that if you want to do this locally
>> instead of remotely fetching the file you then need to compile the docs
>> instead of just fetching the source code for the docs. The intersphinx code is
>> in the Sphinx source tree, so we can always adapt it to generate whatever we
>> need if this isn't 100% matching what you want to do.
>>
>> You could even add a link to the bitbake docs as well since we also have
>> an objects.inv for it.
> 
> Good point, I think what might work is make BitBake's variable definitions
> override the ones from yocto-docs, since we generally "document" BitBake
> variables in yocto-docs with "See :term:`bitbake:<var>` in the BitBake manual."
> 

We have done the opposite till now, have OE-Core point at BitBake's if 
it doesn't augment it, otherwise augment it. So I think you'd lose 
information by having BitBake's override yocto-docs's.

Cheers,
Quentin

