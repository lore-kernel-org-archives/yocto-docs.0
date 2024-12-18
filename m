Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8FEE77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 13:39:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web10.105604.1734529161757944489
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 05:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=V9QtphTr;
 spf=pass (domain: cherry.de, ip: 40.107.21.75, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGUm4nQdW/XMG2eYyqiRnLIFDKv+XTvRC/5NS7Z8rZeGhawkZffnUORqvRiTQn3AN7VL1hbtcgukK2YNWlFkKlKN4EVPL3ktAJ4AwS+FJETdsCMUDYdlCwHQhJqvxDH1jCnLD+32Wl29xiQGUpBuibAqykp1O/1RNk031Qh+x4jQxd1p594okW7JATgL/uDTfSTRIA5cXeAj4f6kb0KiinuFXxPvl2tU7vykWaJrP+kNktsgIheX2lS/eRweHG2Fl3vm8bvF6EsFnuAT1+4oN6onT9BOFELbzUzurXK7xT7oUoP8oT+qim0vLyghucPVWUq8iaourkKXFZoO3AfAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAU6WJvQw9KB7TrR6lYJBS2SuyyvLbtqMa2pipCC9Gk=;
 b=rRoEddMbJoynaHxQ0xfoR8BRTd6yNGboVBnAsS03dlMn9MoiRdGUexgsSOnli372B2Ku5RtZOU94s+Uh47S/okAi05fore/xvdD4c96Y9RjdujQ3UCgQwC+p8ED/QwCUkNQfzzouQYe4bSchTKCE+uqtjtNaz3lnsHhRlju7EOaAb6NZFXsgXgVVk5UJAJxFKx0tDHraVHAOXUIdBh1QSixHLSRsPzfavjFecyExLgXuKAjlhZT6s0mMklmn9sossDKUOoqhVEegNjJ6C1ss3g+7D3lhe574Q3G/3NOMPOdSsUPA6oeET4E0GyW5cYlbz4oEX0GYPjIY1fv0U70DJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAU6WJvQw9KB7TrR6lYJBS2SuyyvLbtqMa2pipCC9Gk=;
 b=V9QtphTrGoaF6ZywLhquIew8b8CkgMURA6PGjCBpCcpaTf17zArsqV2piPfDIFCmJ5JaZ4QXExX83PFT32cnh5II9P9g3YNILsJnQm/9OKNpCtspD4y7usf41wjGthRlolJu0YzLfu89xhua2t2eJLsl6uyWPe31Vwjc3Utueio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7975.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 13:39:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.013; Wed, 18 Dec 2024
 13:39:18 +0000
Message-ID: <c1320e21-8f72-4140-ba73-46c907b95cee@cherry.de>
Date: Wed, 18 Dec 2024 14:39:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] set_versions.py: use
 backward-compatible python argument in run
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-capture-output-compat-v1-1-d8f147a12eea@bootlin.com>
 <3c0405f4-6059-411a-8854-727581e37484@cherry.de>
 <D6EOH4KNGJ45.1ZSRSG06NDDWS@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D6EOH4KNGJ45.1ZSRSG06NDDWS@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 62167385-567b-4d34-29b1-08dd1f695eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REtFYmNqRUNsWU5pNUhXdzM0RS9wUUp3SjdNeStobjNJajJ4THU3OFZtN2pO?=
 =?utf-8?B?dkNrU21CcWRQYnFxcUF4VFNrSVlMWTVkZ0hLZ0M5L29BUnJOUnhleDRCaWZH?=
 =?utf-8?B?MTlTSnBoYXlia2RnVDFzWEQ2Q2xyUGRrT0V5bEJTaUhBVEpTcFpRUjBQNHNO?=
 =?utf-8?B?MTBiVGIxdTFLWGJyVllVV3V6cVVvYVk0SUtvQkMrTW5sazlLVVZGNmJ0eXZM?=
 =?utf-8?B?R1Y5ckRJblgwZUNkS2U4aVBmZVRMNllKSmFGRTExOUdHeUFXVmJwRTR6SGor?=
 =?utf-8?B?SXBjZ0J6YVN3NUpPZzM2QUVEaTc4TUVlTTg1Z1BGNVhRM2pVVDhKNUVOUjAr?=
 =?utf-8?B?VXo4OStPNHUwRDNuT3BSb1E3dGliNVNDanFaempiOXhpQ01hRXBPdnBaUS8r?=
 =?utf-8?B?U2pkSDgyeUk5a0QwMU9IcDEwZEN5Mmo3am56UHZQK1lONXNmUGNQby9Uamo2?=
 =?utf-8?B?ZlQxTUFORDJnSFJadXUwWTVrcnFUTnJXelg2MHFTVEFQUUFQL0NFQVZld1dy?=
 =?utf-8?B?MzJJK3gremR5U0Y0THhGRkg5aGZ0SjV2a2F0VXhCblJGWWYrK1RMbG0wYlp3?=
 =?utf-8?B?YnpnZFh1KzllUVROZHYvLzZCQXZmZEpBMkxRQUpETEZRcFM2M2N6UjBVYThq?=
 =?utf-8?B?RVEweUdFRGxzKzBHMEtEUGxnRldmYnFlWkcySnVPWHladEFiR1RRYlRYbUpI?=
 =?utf-8?B?U0hwb3RTVDR3azdhZzIxOXVIRXBCMDFTK2YydFMvZ2ZDUkxFc1BSdTlDMWgx?=
 =?utf-8?B?dnVFd3BPb25HOWloYkxBc0w2Sk1ZNUhPTEJqNENiYzQvRUh1MTJTMkFiVXZr?=
 =?utf-8?B?aWlybU9TYXJKRWc0d3lVUWw4cUJKbk80MWtCbTdORnFaZU9FYTV2c3RaaWhp?=
 =?utf-8?B?bzh3NUEwdDB0MEhsUS8zVzVLL2w3N1RBL212VGR3TXZjK3NJN1BxS1U5akx0?=
 =?utf-8?B?cnZDMVBzZmRrTFkvdEJURXFTdDVUdGdxVVhuK25sbHJsRm9qaTZTZWVQWVNu?=
 =?utf-8?B?OXNKQlQ5L3pNRSt6aVoyMEg1MTU5V3hKQjBLSjBWRUs4MU5UeHJiUm9kVEkz?=
 =?utf-8?B?Z2d2cG1VUjhXVlhQbG5QT2x6RmY0NUhaQTJSbGRXVXRQeGptN1pxSlQxMWps?=
 =?utf-8?B?ODZsTUxjMjlaRmtJOGpINytQengxTyt4ZktBUlZEdFlrZ241R0ZNSDJ4a2JE?=
 =?utf-8?B?WkYzOUFiSWtiNEhUK3ZPcUd4czNqbllrSnJpZTVuYXRadEJuNER4QnpoVGFD?=
 =?utf-8?B?Z3lVUWVuZVRNQlgvWlJweUtEdFBHU3l0SjUzNjhSdDBPZDdoYXBBUlFpZFBj?=
 =?utf-8?B?SUtvSktTYmpScHUzWFVtdThETitOZmkycTg0ZlN2MWlMbjRLT1hPclhiNFdv?=
 =?utf-8?B?N2U5QlVsMnRHdjRTd1Rrb2VXTThid1k2WVdUNDl4ZVRpRW0xSEpCWDRHU2s3?=
 =?utf-8?B?QllSVC8wN2tkL3RoOURtUDBzR1VTOGp1cEFKNUIxSUR3SW5FM0tzQkZiYTNO?=
 =?utf-8?B?RnhMeVRtZVRRdWhpTm1mVGlYK3pkQU1xTUkvUHV1alFXUkEyNkc0ZUt5RytZ?=
 =?utf-8?B?VkcvNUFNVzdGdC90WU5TNk5hNjkzMlNtM1J3elZ6RCt4WFRMS2hTQ0dnV1hV?=
 =?utf-8?B?V0xXTjkxMG01WTBhRWVzcWJ2M1FtSkdHTGNwVHJxQlJGMU5NemxqV1JPMVRF?=
 =?utf-8?B?eUJWcTJpVjlnOFpWMXNGUGVKeUtVV3VjcHlWQ2pTeGEwZzRtR09IQjNTdy9J?=
 =?utf-8?Q?RmscoOV/7m6YYlwE9VZfzScgKU9xU2vOzvAZ3Zj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGpiUTk2YVJNRkl1VUpGMVVhd0VjU0pOUFdWNENtdG54a2tyaERSVndpMW5u?=
 =?utf-8?B?Ym4vbElMTUlJeGlKVWcvRG1aL0tUeWlxbld0L1JpNjFXc29nTWlBOFlhVDdN?=
 =?utf-8?B?NUUxZzV0ZzgrQ3U2OHFzZFVkcjNubWMwd2JKSTEyZFJ2aHM0STBGVkR2Q2Vu?=
 =?utf-8?B?VE9nUFF5cDM4clZheFppSlg5YUdUUXR6U0JaQXVZNGNKVzZCZTZmZExEckJZ?=
 =?utf-8?B?M2NoYkZua1ljRTJFelR1VTM4SlloWXlWSlEyY0g1SzZmQ1FDZlo0ZnFJVTFY?=
 =?utf-8?B?cGJxVGFtaVlROWVsT0RUTlBiUnN1UzhBYnRHMzNzWDNiSEFTcVNoK3VaLzBQ?=
 =?utf-8?B?eURxcHFUMFA5TWJweHZWRE9TdmhkemRjemR5a1k4bEhVVWhISTRYWHpHM2lS?=
 =?utf-8?B?WHBWQlgwYXNsVXVEWWY5YTJLQVZFMzdZN21yMStGZ0xiZmdHdFk3T3pZcG91?=
 =?utf-8?B?TmhrNjA1NkgrMHVCSmdVVm5lTm9oNzZwbEVpK1o0SGdpck94dkFBNWp2cVZr?=
 =?utf-8?B?ak9obU1kSkVNSU1GM0JHYWh0d3oyUDc2QlNCQzRPblpvbjFPWkFRSC9QU29H?=
 =?utf-8?B?TDZFMm9OWUN4L3JVOWZ2UU5Bd1E4Y3FrZGZCTnYxSTRXeURGZ2xHNEdXY3Fr?=
 =?utf-8?B?YTBKUUJEUHlxenhtL3VVa3pyUTdGZXpvVDdoY2lxUEtuZVQ2eFBKS1pjajhy?=
 =?utf-8?B?Y0lrbEVWRHJhVnJCbXZmMUNKeHNHZ3JFY0ZqZHBGekxmbjZwY25iQmhwY01p?=
 =?utf-8?B?Y3VUVElhZlR4V0haTDY4WEZsSE1Vc1paZTcyN1E3S05zVEJUY3FqYjV4bU00?=
 =?utf-8?B?eXljUngwdnVzWDBjdzU5NWsxbVZSV1pRZGFtTGJBazRoUDB2L05EbFVPNXds?=
 =?utf-8?B?S2FsRHc2amU5RjZxOVJhRDVPOGJOdVh3dWRmOGcvam05TmxzTCtKNVNLSUhU?=
 =?utf-8?B?S1BVTms5cFQzcGtqVDFjZEt2VDk4eUx3NElOQ2p2Nzc0R0hSdFBkVG1KQXNj?=
 =?utf-8?B?QUkzVTRnc1NZQVVpektnTmI0SFgzYXh6UVU5MWk4T2xNd083QzU1Ymt0cXZG?=
 =?utf-8?B?dlljZWVjbzNqV3R6Ly9XWXNSeVozamZ3eDNEc3ltS21oUFpSTHE2N1UyVHZR?=
 =?utf-8?B?b0tyd0VPeDZDeEMvS2lRcVE2cWVOcXlvbU9CaFNGT1llNGx3R2I4VzVvZFRF?=
 =?utf-8?B?N3Q0RGNYa09mWlBMQlNXTXUrWGFsQ1ROQ0owc1NyRyt2ZkZDdm9BWHhYR01n?=
 =?utf-8?B?dUZMbEszSmhCVjdPeEVmdWJKZTZJcDVQd0lucXprY1BsallKNHVkZUIrQ0lF?=
 =?utf-8?B?WHdBOEFPZ1AwWDFPOFlDWmpyODdtNnBPRUl0c0NScTRlUFJVbHdJcnZ0OWhS?=
 =?utf-8?B?LzVRM0gzaVd6RHh4TS9VdUlaOWhGR3VCY0ZPNUcxTGpvS0gyYXRWS3VYa2VK?=
 =?utf-8?B?bFdQK3JQMHI5b2wvVVRvRTVnRVJxZnBZbWJDZkhMTDBjdXJraW0xVHlVUU8v?=
 =?utf-8?B?eEt1a0lGcFVSbGxYbmk0Ymh1eU5KRVBGZUJURjlxeklmaXh2L3lmTk9zOWJ1?=
 =?utf-8?B?U1hDWUlCNUFKci9CVDFYMWxaZGwwV0lXdnBLVENoQmZVcUZXbi9OQUMxalpY?=
 =?utf-8?B?TWxhNlFxOUJZSGFId1RSdnVva2FXRFcrTUlXTDMwazFhQXpPOU0rMXEwQVBZ?=
 =?utf-8?B?ODJMb1dZd2xLTkxWN0UydnJhT3JERWg4b1BkUXBQRkNIZVFGN1RmdHVHbHVV?=
 =?utf-8?B?M1I5aC9oUnNFamZxZ2VqT1UwcTNVQys1WFpwcVVIZW51ZzltYSt1dEY5dlNB?=
 =?utf-8?B?eS90SHJiRXV2aXNpTzlJUDNnaUJkTFdqS2tXYjA2UlFlekl5QWROd3pQMzRZ?=
 =?utf-8?B?KzQwZWh6SG5JbnpoSkwyMnlITDZqWU5KYyszNFYwclhjbFM4M1RGZncyVDZG?=
 =?utf-8?B?NTNQOUhRbHZyaDJSUStMcDFRblpTV0IvRXFYWVF2V3ZyMWpIRkE4M3pSZmtR?=
 =?utf-8?B?SHRrWGhOVEJjMmhrSXJuUGxjb2FtQ2pUN3lGYW1QK1dDMlg0UE95WE5Fa1FG?=
 =?utf-8?B?SnFjTWdXeVpzdVdtYzczN1RGODloeURBUERHNllCUzNlVWRMRThlOVgzYnVo?=
 =?utf-8?B?MUZ6b0N2aVErclo1NjVnK3p3cG5GOTN6NmE2dVVpek5FOWxxNXRmdGVQR1Ju?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 62167385-567b-4d34-29b1-08dd1f695eda
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 13:39:18.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBMli+YBTYW9NT7pFY9YTZPhAwhu8kYbIekRuYFYEg3X3q0gm1SrpRO49U3r2BC0zSmF5/FIy+p9eToonSgmZka13vCfNvvYccSKpZeKN6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7975
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 13:39:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5976

Hi Antonin,

On 12/18/24 9:19 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Dec 17, 2024 at 12:05 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 12/17/24 11:35 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Some workers on the autobuilder reported the following error:
>>>
>>>     File "./set_versions.py", line 102, in <module>
>>>       subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]], capture_output=True, check=True)
>>>     File "/usr/lib64/python3.6/subprocess.py", line 423, in run
>>>       with Popen(*popenargs, **kwargs) as process:
>>>     TypeError: __init__() got an unexpected keyword argument 'capture_output'
>>>
>>> See https://valkyrie.yoctoproject.org/#/builders/34/builds/86.
>>>
>>> This is because capture_output was introduced in Python 3.7, and some of
>>> the support distributions are still on Python 3.6. Since capture_output
>>> is essentially just setting stdout and stderr to PIPE
>>> (https://github.com/python/cpython/blob/3.13/Lib/subprocess.py#L547), do
>>> it manually here to be compatible with older python versions.
>>>
>>> This is also the case for the "text" parameter, introduced in 3.7 to
>>> alias the universal_newlines parameter. Use "universal_newlines" to be
>>> backward-compatible.
>>>
>>> [ YOCTO #15687 ]
>>>
>>
>> Do we really want to open that can of worms?
>>
>> https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-git-tar-python-make-and-gcc-versions
>> clearly states the minimal supported Python version is 3.8.0 so maybe we
>> should just stop building the docs on those distros that are still on
>> old Python? I'm actually surprised building YP on AlmaLinux 8 works
>> then, is it because of uninative?
> 
> We still support 3.6 on Kirkstone. The docs build uses a buildtools tarball to

I see, so the patch should be merged at least for the branches which do 
still support 3.6. For the others, not necessarily. The script isn't 
that big and is not that complex (in terms of Python code, the logic.... 
is another story :) ) so maybe it's fine. Your decision as maintainer. 
The diff looks sound to me (and I used it for building on openSUSE 
within containers), so I guess:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # openSUSE Leap 
15.4-15.6

Thanks!
Quentin

