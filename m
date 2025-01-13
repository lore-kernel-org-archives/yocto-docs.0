Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BC6C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:05:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.43])
 by mx.groups.io with SMTP id smtpd.web11.20735.1736784298324349787
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 08:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DIQtFSVd;
 spf=pass (domain: cherry.de, ip: 40.107.21.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXmnwSXaaXYJDdBB5L9Vy0Fho+YmDTqIM+9TtI5kE+4zRrITHVUElol62NCkrOoNvG2aHSKcdutfTBbwELg7sKuI6OSmTig3MNgDQP20ejWU6l2qLbaUQMhb9mDB7XDm+43aXqFN/IZJA6CyVD97SKe/OM3I52Q1c4eZfm/SM0AIx1S0Ykk1Xh3+tq3i1Fvpb+K2BoduOAVUvIMDmgtwvvqJD4rIx+D8L1+y9ZEDaadpzihYR7EhKsExp8Uad0Hv/cc9ElFC6jOPLe11D4/2jEwxr7mxZxOW8NrTj0hM7ch1lDwRTyPl956zrLo1OkeVv3fzzloFGqd4DKXbos1wdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5VKbp1BFnOvxWpJg3gpQrrYp3yDpR+tmlZnPADaAWk=;
 b=FtOCk4yc8+jZdsQupgtjPWJOKiUaihOgeSJYR7nmF/NHg+IPo8V2QM95SGYPP8xWqi7Z7kOItUvA8a6CYptODzk1j0Y3Y6E/mgboXOoPGse4L0/u+Et9WFT3WlC/byvNMlPq+9ZS9zTWHPhAO58XtWlGvNX4xlWY04AAmKxD2YBWs/qIdGWHJWv/4T8kGpoFiUrPDMiA2lzcrfIGZPZExEv2d9Osf5PzHzeLp8ek/06ttfqvYnZasc3YKZRwm5KpJ39E0HFk06gNpIgqk1XBrRzmAV8Bc1AVw+wpGEJl/EK7OYRaGLWOH4whMp0adlL9HdDowHvDabhDSJhf2ZxMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5VKbp1BFnOvxWpJg3gpQrrYp3yDpR+tmlZnPADaAWk=;
 b=DIQtFSVd3yvGECHjNmOw4SfKAD1cZzTYdTX2jAp0NLUncabjlw1w8JbEE4VC8h5gCnaWfdsT5S2uJDoXfXrrVXYUnMSi9KwIpYJfzS8tgpPTjqy4I5nyAYjepUNm1RgvZ016qnGr+j2/XkfNZlQh3v3L9RMkRhKN8kfkzfReAmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10824.eurprd04.prod.outlook.com (2603:10a6:150:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Mon, 13 Jan
 2025 16:04:52 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 16:04:52 +0000
Message-ID: <dfbdf860-17ec-430b-96b2-6b4a1b1d601e@cherry.de>
Date: Mon, 13 Jan 2025 17:04:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] SSTATE_MIRRORS/SOURCE_MIRROR_URL: add instructions
 for mirror authentication
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 peter.zsifkovits@at.bosch.com
References: <20241224-sstate-mirror-user-password-v1-1-d33e424617be@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241224-sstate-mirror-user-password-v1-1-d33e424617be@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10824:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b4d994-dde5-4d80-4cd9-08dd33ec03c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d3dMazJaNWFxS1pKWXhxemRSc1dDNWVIaDBzMFN4d0JiNUFyN0RaM29qbGNh?=
 =?utf-8?B?QWdsV1FXR3lXdUw1MzN5SXZRbVJxZWhxb3NaOHlCNllwclFEQzQyVmI4dzBm?=
 =?utf-8?B?RXpmTnh3bTJZL2c4N3lrWlRUeTRVcmorQXZ3QmhaVk1yMCtOSGpVYTVmVGds?=
 =?utf-8?B?cFNWSGdjNnprdlBQMVd3NlhaMU82eGhxTG5yMi93c1V2N1UxWFJwcFdXTjVP?=
 =?utf-8?B?V1FLUzQzNmR5SUkrMlRPejRsdG0zZVFOUmllOFlHVnFUZDBpZjl1SGZmVHA1?=
 =?utf-8?B?MlVDWG9SbWI3SCtiMUw2dDhhS2JadkR6RXR0UG5WeFlYVE1YYU05VGhSS3pi?=
 =?utf-8?B?Z2R4QlVBRTZLcTlUUWNDc3pCNG9PTHIxUFZsdHV2c1dJK0EyUlBGUFhpa1NB?=
 =?utf-8?B?RkFWWXMrcEZvL0NJY05lc2xNMDg5WVVPbUF1cEw1WTZGc041T2cvVUpuRzJP?=
 =?utf-8?B?d3RQemxwK1FDa2FGWWN4Y29yUHYvWVEvRzhQYVR2bmpzeXVkUm9ySE1oSjdl?=
 =?utf-8?B?RlZ0cHE3SkZQVEp6dXpFNnl2Qmw4Vk1ZWEtIT2xWak9TSVEzNTlwUytUREpr?=
 =?utf-8?B?QmlUelFTUXBuaW53SWRMaW1WY0dWVG1CeEpDVXU5cVdpTUVmLzY1M3pKblZW?=
 =?utf-8?B?MktTU3NKMHc3elZBQ2dMcGgzNE41c2ZOUFl2Z2xTZGhFWnkrdUQzMU9ESDV6?=
 =?utf-8?B?Y0IxelpxN08rZHRDV2F2MHJWSGp3bkZ3dGRkOUMvZzNwVVBubm9RUmgyN1Fp?=
 =?utf-8?B?djRRTEZBN21nWUdHNis2cXZmRk40Uy81OFhETTlSMXlPeFNWUll2LzBQU29v?=
 =?utf-8?B?eGJRNjFZN1lzazFTYnRxeWg0NnlkWlN1WU5ibkZpTHF1SjA1cEx3blE5YWZo?=
 =?utf-8?B?ZzAycnNzc0tZVjJwZkdFRmZWSHN4RmwzZVVVVG0yUHhHTjk2bEEveHRVYUlZ?=
 =?utf-8?B?c1lwVmRxVG9vOWZCcm41TTI2TEhkek9YQnExUWNiTm5iblgrQ0lneHF2Rktu?=
 =?utf-8?B?M2ROWmRwY0Q1YXpFRy93Rjd4UElkYm80UjhMWkdLUEIzUFFodHArckFXYkds?=
 =?utf-8?B?bWhERWNUWjdhWnZPbkplZWRzSGJkZVEySlBlWnc4Q3F2THZMR2xGaTVSK1U4?=
 =?utf-8?B?MXVZbUFKdDF5WnFkVWQ0bG85c0g5d3l5S1FoelNib3V2N3JqRk5uZkFueDhG?=
 =?utf-8?B?bURCenJOSjV6SW1VYkVlWDIyb0VrVFQzY1A0L29hOFdtVlNGSEp1NkpGS3A5?=
 =?utf-8?B?d3NIR2NaQ2pZajJiYkE5YzFYNjZVNnpVV1FldlUwb0QvV1VhRWdVdFZsUlo4?=
 =?utf-8?B?K2V4QjRFV212Z21yUmtMb1MzcGIyVU1hRUtMT2ZMVGtMMFo4dm41U3hnRi96?=
 =?utf-8?B?NU5VdnpqZUVybDg3QzdUeXpDRTVrQjdTclJnQ1Uxa1VuejJUc0h2b3B2VFQx?=
 =?utf-8?B?VHZHRmFyWHZhckdmRTNQTXpxM0pTZ3dmUGpiV1pueGpZZlhIdWtNUEhJaFZ4?=
 =?utf-8?B?RG8xZnZ1TndLTXZES0FnWUgvWjQ5cDVuUTNJQlRIZUxySGVRakZXTngyanJw?=
 =?utf-8?B?QWMxZ2F0dFFvbHd6SW5oMGdRdTAyVFJLNjROQUJ5TkJFKzZmbDJhOVJvY240?=
 =?utf-8?B?UUVKVzVqZzBsYWpLOTl1WURGK0NKUzJiY2hpaFFwNExqZ3BScHI2NW5LM21C?=
 =?utf-8?B?bG1nV0pyWVcwUHVYeGprUkpWOU1XbFd1NEJNTmF4b3BweVpLdnlYUWxrZU1M?=
 =?utf-8?B?YWNDUS84dzYxRGpEZWlMR3huR1pXTkl2cjlObjFkY2NWRTBTZmtwTVNEVHJB?=
 =?utf-8?B?TTltV2Z6ZUFSTE9MTUQzQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWRJKzFoZlRjVmNoVm9CeDJmb085cGIzQU8vVlRGT3Z6S0pKem5pdHYyRFVJ?=
 =?utf-8?B?aHdaTGZ6Z2NQNmlHWUlzZzd4K01wTXdpWVZvV0E2RWxCUzY3U1lNcjdGcGtP?=
 =?utf-8?B?WkQzSmxzdG5UbU1zbkVyY25lVzBmUE04eStBK0RsRjdkUXJqamExRGFJTisv?=
 =?utf-8?B?VkRvdmhXQzBBWWZXQjU5cEk1eC9nNFg0VHQ5MWsyMGxTMk5yMHNzWVZLRElx?=
 =?utf-8?B?Nzl0VmVRdWZrdnVuU05JSGZJVHlJV3dIUUtMUUxHQldLN2Y3YXd4RmpEVWd3?=
 =?utf-8?B?VzU4d3B2UC9tR3RxZ2RiOVhlNWF0bUdoLy81VGU4NUh3RG5ZZitXQXgyZkpZ?=
 =?utf-8?B?T1puZ2xzTVpsNUtsMDd6M3UzMlZaTUdTN2UyL1dqcDRvVjZrRnhldFlURnpj?=
 =?utf-8?B?UlFhRnA4Vzd5blh5SkIxU2syY0ZYbWtFdkxFb2tveEFMc3liZmRIdDN2TzNT?=
 =?utf-8?B?N25qT3dWRVlBTlp3ekR3RDBMdmVFOWRvQ0IxakU4RGx6NXFzTXg3WkVEWlZK?=
 =?utf-8?B?cXJseFNjWWljdll5SWE4QVBpSzFCTDM5UDlFd3lFNE5HWU1PTXA2L0s1U1Nw?=
 =?utf-8?B?eW1WUEhkTlVwT1JZOU92TTVnNGIzaEF2R1VjWEdjNE1pcmkvVDRQQ25INmcv?=
 =?utf-8?B?bU1QU2Rja1ZqdnhUTld6dFF2bEsrbXZaQXl3WGxrTUk2U1RBbWtqcDhiQjlU?=
 =?utf-8?B?UzBYV2w4Z1BHSFFHNWdiRHpYc2ZmL3NZcnB3akFmcTRiWEdOVjIxVWRaU0Q0?=
 =?utf-8?B?NjBpMXhMVDdYNVpING9FSWZOYlpSWEE5K3BMWXJYT0U5bzBTRi9STGhoaURa?=
 =?utf-8?B?cUlLdERDMU5vT3drNWZ3WVNpaXhmeUZqRXB6MkE3ekRCSWIycTFHSysyN2My?=
 =?utf-8?B?UWZuU3Q2T2Q5bmlHSFpkUHp3R000N0pFM0tOOUJPbFJaSndwdk40RU1xWkpq?=
 =?utf-8?B?cWxveXBCTG82SEEvZ21oYWgyR2c0MWRWajREV3V5SG1saGpLU1ZVU3RMN1VY?=
 =?utf-8?B?N0tiMWc4NE1WYlQ1b2swUkIyV21EODQvKzAwdDZ1OTY2YlEyTjlMaGFGSUhi?=
 =?utf-8?B?V3J2NWlFMGZza1JWRGdiQTV0M1ZzMGxtNjV6dVhHVHQzcysvT2t3bzhwSWpQ?=
 =?utf-8?B?bmRhdk5pVmRsVy9yRFZEYlorTjFkSjg3SnhvNjVManFEL2djRDVxbWJwUTdj?=
 =?utf-8?B?NUorNTFCTzdac2dMWjV2UTRJdklOMHFFZGpaOVpsSmhBWGVaUU0zc1R3elJ2?=
 =?utf-8?B?cmtHaWU3eE05YnFKd1RobXZIZEx1aUpCcUxiZDAwZExvNkNjOTNzeFQ3anhI?=
 =?utf-8?B?V21kTUJCNU9iek5TZlAvb0xoL2RVZUhpTFB3WDJaQWpBbWpMN2k2aWNmTG1r?=
 =?utf-8?B?akJrWDlrQjBZMUUwSzYyLzd4NkQrUFhRZ1pzZDNHcWxuWkUwUWRUMHN1UGlU?=
 =?utf-8?B?ckZzbkgvUGlob3EzWEFVRGlIMlA0TzRBWkFGcURCVjNMSkNvVXVNVGx0WC9X?=
 =?utf-8?B?WkhBeDVoVHUxWitkbDFBVW5RUklLS0FZMzRFcFEvRkJNMHpTTjY3dGdZa2w0?=
 =?utf-8?B?MHlMQkMzbGJKUnJUK25vd0d6Mnd4M0xNQmlKQmR0WXAzaC9reGpqb0NISDRy?=
 =?utf-8?B?TFJPVnJCelJJUUNvMU5ia0xhV3paaUJzSkFheG9lSGZVMWI0K0N5OFFMbEI1?=
 =?utf-8?B?SEtuSWRKb0pNVHZuSlFhNHFHdk9oQzVrS3V3Um9LNmR2aVVGdWFTV3EvKzhH?=
 =?utf-8?B?OEZiUGhTbUpXK0o2VFJnaDI2TWVnczNtSkhnR0hPSUd4cUpuWTA4eXNEUytV?=
 =?utf-8?B?YjVYSEExa2ExWUZwVkxlanJJbTlxeEltQ2VLNXNtR0I3UnIzTWNyWFNhS2xJ?=
 =?utf-8?B?eHJjbFdnNENWZ1JiSU13RHV4TlIyMTFYY0xudStXLzFBbGx1Z0tpYTc5Y2RK?=
 =?utf-8?B?TEZYWGpGVmFWVUdVN3pRMmRjQlBNV25aY2VEb2VSeUpJVDJHRkRRZTliL2dZ?=
 =?utf-8?B?aVhaMWNEVzFyQ0hxUHN0d01udE81aC9MRGRwcVNNR3BJQlRxSHZQb0RyZ2J5?=
 =?utf-8?B?TmY3cURiMHJHVnczbWFrK1Y5MjdCek1lZGpJRlErVXhtUzFGRUZHS3h3d0F2?=
 =?utf-8?B?WnVCTjMzaGtmaTBreG83cGRqZFFTWGs0VXRoZU1idmhNVTFudmdqckgrZUcy?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b4d994-dde5-4d80-4cd9-08dd33ec03c0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:04:52.6398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnelZb9Q+KqWdYslsW3e/y+TUPf8lIBkVszIaD7cTDRjOFu18AiFOjOcBymWIEo6rTtDQeqyLD78WcBAty2zRmQPplwyVtTfi0tTrKnusj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10824
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 16:05:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6085

Hi Antonin,

On 12/24/24 4:35 PM, Antonin Godard via lists.yoctoproject.org wrote:
> [ YOCTO #15218 ]
> 
> There are different ways of configuring the build host when
> authentication to a mirror (SSTATE_MIRRORS or SOURCE_MIRROR_URL) is
> required.
> 
> Document these methods, and begin with the preferred approach which is
> to edit ~/.netrc appropriately. When that is not possible, specifying
> the credentials from the URL is also possible, so document it as well.
> 
> Reported-by: peter.zsifkovits@at.bosch.com
> Tested-by: Antonin Godard <antonin.godard@bootlin.com> # Debian 12 container
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Tested in a Debian 12 container like so:
> 
>    $ mkdir downloads
>    $ cp .../{bash-5.2.21.tar.gz,bash-5.2.21.tar.gz.done} downloads/
>    $ pip install sauth # python http server with basic auth
>    $ sauth username password 127.0.0.1
> 
> In local.conf:
> 
>    INHERIT += "own-mirrors"
>    SOURCE_MIRROR_URL = "http://127.0.0.1:8333/downloads"
>    BB_ALLOWED_NETWORKS = "127.0.0.1"
> 
> In bitbake's shell:
> 
>    $ bitbake bash -c cleanall
>    $ bitbake bash -c fetch
> 
> As expected, error in log.do_fetch:
> 
>    Connecting to 127.0.0.1:8333... connected.
>    HTTP request sent, awaiting response... 401 Unauthorized
> 
> Now, configure the following in ~/.netrc:
> 
>    machine 127.0.0.1
>    login username
>    password password
> 
> Try again: "bitbake bash -c fetch" runs successfully.
> 
> Remove ~/.netrc, replace in local.conf:
> 
>    SOURCE_MIRROR_URL = "http://127.0.0.1:8333/downloads;user=username;pswd=password"
> 
> In bitbake's shell:
> 
>    $ bitbake bash -c cleanall
>    $ bitbake bash -c fetch
> 
> "bitbake bash -c fetch" runs successfully.
> ---
>   documentation/ref-manual/variables.rst | 53 ++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e8db89f8c9642b1e36c574e1369093a7a2ce30a4..88eda960d0f06307d483ecd9c2f6d1c9cc6920f4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8032,6 +8032,31 @@ system and gives an overview of their function and contents.
>   
>            You can specify only a single URL in :term:`SOURCE_MIRROR_URL`.
>   
> +      .. note::
> +
> +         If the mirror is protected behind a username and password, the
> +         :term:`build host` needs to be configured so the :term:`build system
> +         <OpenEmbedded Build System>` is able to fetch from the mirror.
> +
> +         The recommended way to do that is by setting the following parameters
> +         in ``$HOME/.netrc`` (``$HOME`` being the :term:`build host` home
> +         directory)::
> +
> +            machine example.com
> +            login <user>
> +            password <password>
> +
> +         This file requires permissions set to ``400`` or ``600`` to prevent
> +         other users from reading the file::
> +
> +            chmod 600 "$HOME/.netrc"
> +
> +         Another method to configure the username and password is from the URL
> +         in :term:`SOURCE_MIRROR_URL` directly, with the ``user`` and ``pswd``
> +         parameters::
> +
> +            SOURCE_MIRROR_URL = "http://example.com/my_source_mirror;user=<user>;pswd=<password>"
> +
>      :term:`SPDX_ARCHIVE_PACKAGED`
>         This option allows to add to :term:`SPDX` output compressed archives
>         of the files in the generated target packages.
> @@ -8439,6 +8464,34 @@ system and gives an overview of their function and contents.
>                file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
>                file://.* file:///some-local-dir/sstate/PATH"
>   
> +      .. note::
> +
> +         If the mirror is protected behind a username and password, the
> +         :term:`build host` needs to be configured so the :term:`build system
> +         <OpenEmbedded Build System>` is able to download the sstate cache using
> +         authentication.
> +
> +         The recommended way to do that is by setting the following parameters
> +         in ``$HOME/.netrc`` (``$HOME`` being the :term:`build host` home
> +         directory)::
> +
> +            machine someserver.tld
> +            login <user>
> +            password <password>
> +
> +         This file requires permissions set to ``400`` or ``600`` to prevent
> +         other users from reading the file::
> +
> +            chmod 600 "$HOME/.netrc"
> +
> +         Another method to configure the username and password is from the
> +         URL in :term:`SSTATE_MIRRORS` directly, with the ``user`` and ``pswd``
> +         parameters::
> +
> +            SSTATE_MIRRORS ?= "\
> +                file://.* https://someserver.tld/share/sstate/PATH;user=<user>;pswd=<password>;downloadfilename=PATH \
> +            "
> +

Considering most of the added text is common between SSTATE_MIRRORS and 
SOURCE_MIRROR_URL maybe we should use a substitution? c.f. 
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#substitutions

Looks good to me otherwise,
Cheers,
Quentin

