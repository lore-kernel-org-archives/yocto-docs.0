Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0973C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 10:48:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.25])
 by mx.groups.io with SMTP id smtpd.web11.66850.1738925298661512887
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 02:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PNZOSfXL;
 spf=pass (domain: cherry.de, ip: 40.107.159.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSBUeISoC8tQOT2xBWpUDFBoAK/H0InaFa0AiMvLt1ee/idmt57EWtUcf0z4hXjpp0gLnX+jeqf93G+PqL5Ac4U4ikQ+C1dMb/Of1Y4QAYqTHiVgkVv66EekZpcTzNFHAaRiDh739UZ12RzlncWRVBrIEP+GZjalqkps88aX/NN4sl+jc3t8gxXWblBCAjWF2plwRLt6KQ9CLhVcp1aoQEzLs8dwrBLXemyRitytHGDnMID0YgpP7udJ+wgLJEPSXe3c6tVPCb3zLIbwbVy+Cc9kabzIbcWask1TunD5K6mTegc9rmwpqyyVNhLqksZ+5BEjaRLL9l9GRPdESRKAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaFgs8IdoMHlOXpNLyQd96kxol1USvyeIw2WGLHn4rk=;
 b=VEvRwcNgzA+M9ubTwcLc4ax20eiAU52cxUY9CsL2TfI7CkycWGShbb45HPmaFvtEI8ubNN75QKdM4p0JDq++rSH6Gt91CaD65tObjRVotJYv730SbBq/UvUcEb4nTwLQU2q1p9oS73Lrrda3/C/qp7IWgJ56RY8rpDaCmnD7HJiUbuDShprlMdco/FcWvFuGm01yDc7xY+f/LSBKJCXbfJJGdOrjCIlLzFwhusj0TdT07HsqiYRs013rmr6enDltzELMYA2G5p1aT8fkjZqWT4QeRBcHN91xAxEM9TYZ9X8uMpVgm8KzeIXY0iLSfC8jNqolzfm8xkomHwxrxrGphQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaFgs8IdoMHlOXpNLyQd96kxol1USvyeIw2WGLHn4rk=;
 b=PNZOSfXLnpxH4apAgL0bgmUQLxwSVpuFIlbOcP7re1gy0GZnluwDXiNrnt5y6Wqh0N4y+YS29lO/GTaBtWNs2TwJFFrQ3u3DNVfq3rBLUII6GYBWgBNSEKooPNmRqynTFVYlnuM+LPYSfyWTm1CqE+2q2DtctzQUFzpIac7+BII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10534.eurprd04.prod.outlook.com (2603:10a6:150:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 10:48:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 10:48:11 +0000
Message-ID: <f404f281-6a3e-442d-b2f8-ca29940d0c3c@cherry.de>
Date: Fri, 7 Feb 2025 11:48:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] add basic b4 config file
To: Antonin Godard <antonin.godard@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
 <1f9d3cd9c29beb5dd645eae977e34046e277b1b6.camel@linuxfoundation.org>
 <D7M55FM70177.BPEH6BEQMQOU@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D7M55FM70177.BPEH6BEQMQOU@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10534:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe9eece-ffc2-4940-8e13-08dd4764ea81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmlVbmJlY1BvWWVoK1d4c2ZkM1NFNGplQXdpQmo2dVhNQWNvd3AvcUMySjFS?=
 =?utf-8?B?bTBDV3JGL0owalFUaHB3R3IvbzJZTTlua3M4ZkRaVlRycG1aRDNHUUE2eFo1?=
 =?utf-8?B?ejNJakdPR1B0UFo3RnBMTm9qNTBtOTl3N3QxejJzazdSUCtVNXczUlJHTnRh?=
 =?utf-8?B?bG1Ed21RS2gycjdScFovdGtKMnN6TWpwdXRrZ1c5czR6Q3JtaHJvWmVOeXV1?=
 =?utf-8?B?OEsvQnJBbVU1QmFlS2Rlb2trZ2JrTGpGbitwUU1GUEUzdDhqNDJua3poZW1x?=
 =?utf-8?B?dVJmTWZ0UEwyUEJPV0xmU3VUUUJ6OWdRdHowKythSDBBOXg5dTkyTDJ5RmFh?=
 =?utf-8?B?TTU3aUlpRTJzdVhTUldNMzd1UVdJZXhIQjhBUEQyOGZGaUxGL3lwbDRad0lS?=
 =?utf-8?B?NGJTdlhBZENEOE15VEdVeEtLa2hnSUFaQm16Unh6R0k1ek0zM3kvMkNoRHY5?=
 =?utf-8?B?MUZUeUYvbGhlMlplSnVhSUpicTlWcGFsQ2FEU1czL1o4UngzUnV3bUhCYjJy?=
 =?utf-8?B?Nk5SSTdLRlhJYU5qaVphMk82OWw0YWhFOVlPUGtnazJ1MWNDS2lpY0hSSzVI?=
 =?utf-8?B?Yy9tOEVJT0hQVGtQQWJTUDN4b0wreldhQVdoalJzK2lHQXE1ejBiZk91ODFN?=
 =?utf-8?B?UStGeGk1ZFVGeER1YkJNRm5yMXREYVlCazRpT0FDSm1FcVRoSWNkRGdxZStI?=
 =?utf-8?B?MU50WHRvNnhUR1NiQkFudXFsUERsa2hPL3FWeUwyKzJpeDEzTGVKdno2VCtN?=
 =?utf-8?B?T1l3UmROaG1MSStnbXBKOTBNanJ0YnliYTl6L2xtQUdlUGtrL0EyNTNBZDQ4?=
 =?utf-8?B?bXIzSFFRTnhmUTlrSHA0Y0F3ZWdOdGdBdjNSSGo5V0dpNW1TZ1BsNFZmYWZR?=
 =?utf-8?B?MnNIM0YwSlFVSWY0SkhyTTdRTHhwK1dYa3hmM0tpU282bEpaUWdrUmdQM0sv?=
 =?utf-8?B?TS9ZYTZHVFpRRGROZ1hyV0pQSEhFM1JpbXVtbWtrdXRSQTdFUlRYWHlCTkVO?=
 =?utf-8?B?RDd1czVPMjIrODNZTGdCbVVCTnFoNVRzSXY2bS9ndGV6RkFDMW5FcmEwZ0cy?=
 =?utf-8?B?Q2swTnp2TGF0UC85VEZtWjAyZzRHZDNpN1JDNVI0T1Urb1RUOUk5dmtDalg0?=
 =?utf-8?B?WVFZSzVjNEw1aklIV1duYi9nVzdlS0ptenY4NUx1aUhHTHptdUUvVFovdk5J?=
 =?utf-8?B?bHVXU09yZlNZUUdTN09zLzB6ak5kQ1dPb1JyNlJ5RzdMc2trK09GeStmdzJE?=
 =?utf-8?B?eno5K1F0eWRITDFNaVNBdS9aNm9HM3pIZFBwRURqd1pRWjdUcE5PbG1ITEd1?=
 =?utf-8?B?d3ZiOUNMTDVLOHA4TXhaTXgzSFBTZmhwa1UxYUVNMGkrQmNxV0ZvajVkMjZt?=
 =?utf-8?B?NTZlQWlKNjZ0UUlubjh2M3FlVlpHTElQMVFmaHUzL3c5YVBmR2d5Z2N4VU9V?=
 =?utf-8?B?YldiWnVDWmVibkt6WFVhblZyVVpSeG1hL1FwdmttWmhjQVNvMUZqcy9GMG9w?=
 =?utf-8?B?YUVMTkxHVk5sNkE5NC9Nbko4bFJQU3ZabjBSVTVHcW56c0lneWh4SkNUbkZJ?=
 =?utf-8?B?SkNZMFJmLzQxVmxhZDJiWm95RnBnVytDdWNyN2ZuMnhSVXU0a2xjMllRS1Rz?=
 =?utf-8?B?TkFlbXRsYllaN2xQcm9UcUNKVHNhSnIyTFBmZng3U2JDOEFWdEErMG9iNTU4?=
 =?utf-8?B?dmRXWDhxYTVmVjlzeHlsNnNqZThoNlZPWVpPUWhUYjlsekJTTkd3Vk5vN2lv?=
 =?utf-8?B?ekd1MWVGT2xzakdCUkFoemxiZUxXYkt3UC80aTNYemRhVkNHT2YxTnpEeVA3?=
 =?utf-8?B?OFNZYnh3ZU9VYXRPOEhaUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2EyM2tCUlJkSXgvSWV0TFdvUHovTzRNYlA5ZnNKQTNiSFROZnpsVFNWWHMw?=
 =?utf-8?B?TkU3SG1pblBROUZieXF4Vys4QmVFVVZ3Ny9mYmpGOVVHcnVjRFV5dGo5cHo4?=
 =?utf-8?B?RWlpaXVzalVOMU1xRHJ3aEpBZ0QzMElaQno1WnpHOFNkbUMxY3BybFFQZGxN?=
 =?utf-8?B?ai9tNnRncWFETmw5QzNvb2FycW9uUENseHdkZGtEeEpKSk05TnhpTCsyOUV5?=
 =?utf-8?B?eEJRbzF5VDdsWjhTck9VSmEzeTUyai9WWHFXdFVxaFlvQW93SUR1S3ZnMUZQ?=
 =?utf-8?B?N1p6ZVBwWW9VenVadWt5T00yQUl5elpxcjJkcUgwNnd2UFkzVnBFUmpPYVRs?=
 =?utf-8?B?RWFhSjZBZjRHaC9DZkRLVHpGMmFKV1Flc056TWZSWEUxY29TUFhJaEdTUEdF?=
 =?utf-8?B?VktPTVhCeDY4NnNwL2hlUlhla1VGNS8wbXVEUkt1RTd4citTNlErSHkyN2JF?=
 =?utf-8?B?RzNuVjUzMVliREJuU3h3L3JveTlZYkV1aUZYWWZlZ0diUkdYNUhoTlJKcmwv?=
 =?utf-8?B?SVNnTlpObEdzTE5FY0hEcWYrYUxLWDJwVzY3eWJZeGVoT0lFZHJzNk9HK0dJ?=
 =?utf-8?B?c01LN1RzL0szRm1RNk9rYXZYbUVZM2RGd3NuSTNZTHFoY1FZZlFMYnplYS81?=
 =?utf-8?B?RUdlTkhkVDhqYXlycDlYeldhYWU4WUY2c282endFTWMvNW5XNUIwZzh3dXJG?=
 =?utf-8?B?a3BKdkRIUWxCTHp4VjNEeFZ6REx3N3dZNjlPRk16Q0dyaXBHQkJwckNIUXZa?=
 =?utf-8?B?T1NhSEczdUJBYll0MHllZjA0bHlxOVpNNm1MZlVZWjJ4QkJseUIwUGZBNmE2?=
 =?utf-8?B?QVY1VTViSnJENjA5TktIeUYwcTNWYTNyakIxbXErY3hRTXJ0aEIycWFJcjZh?=
 =?utf-8?B?Sm1sQ1R6VHNrajNYRElEbVE5OW96SkpFQXBIcmtUTnNIaEtyOHByRjNVbUxj?=
 =?utf-8?B?djNrZ3ozL3BXUEhEUnpPNHlFRldNNlZVd0xlaXFYTUFua0F6cVpybDJsb2Na?=
 =?utf-8?B?OGhVQVQwWC9Qc2JWbmR1OFJxVkU0M1cvMUM4eGVZWjRPb2tFOFJjOTBJYVps?=
 =?utf-8?B?enAxQWl3Nlc5Mks1N1ZSWVJvQ0Y5Tm9JaHJXUytEMTdoRnNxR1crdDR0SlRT?=
 =?utf-8?B?TUpFZWZpUksxaEF1UGJ6SUNzVzEyaUkyaUNDWGxDdWVzUEpSYk5aVU11dHo4?=
 =?utf-8?B?d05CRk9LRjFuSHJKamZ0RG5Uc1JCd05tTGcvMGV0WXRFTUJ2eVBkcnJ5dm1K?=
 =?utf-8?B?cVkrNHFmSVFJTmhYU3RPZzZtdUVmaUQzWE9VOGpaQXYzVDEyL0lINlovZC95?=
 =?utf-8?B?TXpqVTNIMEtRVWxhR2NWbkg2MzZkOVoxM3IxQ3FxbWs1ejl6Q2pCa0hRaHRa?=
 =?utf-8?B?a1FGb3A5MVltOFZoSlZhOURLTXdtVFBiYkhWS3B5UTltZTJjUDgzOGpDK1J3?=
 =?utf-8?B?L3M1cW0xcGpMZ0tkd216MVpLdzQ2eml5QmV5WmtUSXk3TUx0NEJwOGt2SlhL?=
 =?utf-8?B?eXNDQ0cxaXZsS0h2OWI4Q0g5NEhiOWFpRFdva1B3ODN6U092Y3ZrL2duT2Jt?=
 =?utf-8?B?WmFkTWZCTWxTVWY5UEZ4TW9BeVJBbE9mVDFpREtUcktIYm40UlUvN3kxOGNK?=
 =?utf-8?B?WVdud0lsME51NjZneXhPSWlYTlplU215UlBIZjV6eEZQWEFvRU1TdGNpeStZ?=
 =?utf-8?B?NkRZczZYTFAvMEtnV3ZUUXhyTmJYeGdERXJ3WjVwdWV0UUFXdUZtbkpoMXF3?=
 =?utf-8?B?dWN1NWRCeHJQdHNGT3RCZ1JXSGhqOTQ4OWllMWdab0xmRGE5Z1RnemFUbTlN?=
 =?utf-8?B?OUZpK1U2Vk1EL1pteE5yeDFhaEZtc09rbHJhTXJHd3N3aFgxcDJJWS9zR3cv?=
 =?utf-8?B?bzZLazlTRnFHSEtOYWlDYVlJUlJYWHZnNWd0bVZYR0NDc1oxYVpoQUY2aC9a?=
 =?utf-8?B?bTZ4ZC9xRmExZlpDcVZZUGc2K2xiN0ZLMFVXOXN0OFk5d2ZqYWE5aDJpVTNj?=
 =?utf-8?B?SVArYlQxK3ZVOHFwb2dRQjhQSVBmV29LZ0JtUEJNRXhHQlIyNGQ3NjVaa3l6?=
 =?utf-8?B?akd6K0ZTMWRObWVrM0xnc096T2plS3ovQll6eHBhQTYveGxVcWhIS2hqeGhl?=
 =?utf-8?B?NEdDQytzSzdGSDVjMFR3Z09tbVhEcTVvZHZreDk3NENXRmtPMjRjUDcxOEFT?=
 =?utf-8?Q?HWaUqSdDrL8/BBbbd/b9mvM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe9eece-ffc2-4940-8e13-08dd4764ea81
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 10:48:11.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xFBKAaMJ6ZyW3hZZaEDFXKgWXzB/9OcK4//n1Hw8pHx25mEgqMh9ljlXR0JZBotz9yxsUEQk8W8iX9wa+zuj7f4+2GozuMuAiVehbCHA1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10534
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 10:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6294

Hi Antonin,

On 2/7/25 11:28 AM, Antonin Godard wrote:
> On Fri Feb 7, 2025 at 10:53 AM CET, Richard Purdie wrote:
>> On Fri, 2025-02-07 at 10:26 +0100, Quentin Schulz via
>> lists.yoctoproject.org wrote:
>>> At the same time, I've done some shady stuff with b4 for poky where I
>>> check (rather **guess**) if the current patch is the last patch in a
>>> series. c.f.
>>> https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapper-poky.py#n44
>>>
>>>> In any case we might also use your container scripts for this
>>>> (which I will get
>>>> to soon hopefully!).
>>>>
>>>
>>> That itself may be adding a lot of time to the test since we need to
>>> compile the container first. Additionally, remember that absolutely
>>> NO
>>> message should be output to stdout or stderr by the script otherwise
>>> the
>>> check is understood as a fail. I'm wondering if we couldn't add
>>> support
>>> for a PIPE between b4 and the scripts so that we can ask it to print
>>> stuff (e.g. "please be patient, this may take a while" and maybe even
>>> print some progress). For example, I briefly added some WIP support
>>> for
>>> patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time
>>> before returning something, not very user-friendly :/
>>
>> My view is that any preflight checks should be relatively fast. We
>> could ask someone setup an autobuilder in a container and run the whole
>> AB test matrix but that would be unfair and crazy! :)
>>
>> I'm fine with having two levels of checks but I do think we need
>> something relatively quick by default else nobody will use it.
> 
> After a clean build, for me it takes ~10 to 15 seconds to build the documentation
> in html format. Most of the time is taken to index everything, so the output
> format doesn't really matter.
> 
> So, quite a long build from my perspective. Not sure there's much we can do
> about it, though.
> 

Also, on which PC are you building that? Some people may compile on much 
less powerful PCs for example.

> We do have sphinx-lint, which takes ~half a second for variables.rst (likely the
> biggest file here). So we could perhaps run that against each file the patch
> series modifies (per-commit).

Any time you add linters, you take the risk of false positives. For 
public CI (e.g. GitLab CI), it is "fine" because you can tell people to 
ignore it. When run locally, that's a different story.

Finally, sphinx-lint only supports Python 3.8+ (and even dropped support 
for 3.8 in the main branch), we still want to build on Python 
3.6-systems, so that makes it an unlikely tool to use for us for the 
time being.

> We would have to solve the existing issues, though! :)
> There are also areas of improvements for this linter, for example enforcing
> three spaces for indents, etc. I'm willing to put some time into it, if that's
> an option we consider for b4 checking.
> 

Should we really be holding off b4 support for this?

We already cannot enforce requirements on running anything before 
sending patches with git send-email, supporting b4 doesn't need to be 
better from that side from the start, we can just start by supporting a 
different contribution workflow and build on that if and when desired.

Cheers,
Quentin

