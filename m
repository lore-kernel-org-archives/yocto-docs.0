Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D1BC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 12:10:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6357.1790251827497155199
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 05:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=B97OtGo8;
 spf=pass (domain: cherry.de, ip: 40.107.159.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSvF2rx3Ew6WRSyZXCjBnTT8ooq2nyT+HotZ+KGLAVxobDU4b60Z/rgjSy1DZtL//Rs+4sLj83ukGlQjdfbfISpdMBFpprHLZCIgu8uyqT5wDuVGePqoklppGgh19BarCXRJwdH3ZzaDioKrS3D9V4cx08NPNSb8+37NQciTxl4jpoZXQ5UHboNVbxGa518AGYA1UbhGcEcnlsMg1HVYg0ZyEy93t55uyChDavk0qkaE5Epbpls7zgiMlApxEGspx8/qYP+PAf+aaF3KXgIPem4WeJSXPxzD7lL+IOjS99Gak45CLswbML1dpmSkpw0KjttqkBS6Iuw7Qa2n5G+vfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzS25Q1vYQWuyYgqh29wH5T1BN/w50iEhcCcBXoVMRY=;
 b=zCAv04tMTb+vKP7Iw3YDNN8KkwTr+GpjXOvYyjRMtrGiJq5QEDD6UNLBpDUbHgE56BucL19ds86Z8gl3nht4nBC4qAlboLD4hyN35MDoC35fNmZYl8vNKiYf0gJlQfxRY10a7Ll65Iw8qqrCzB2FgJjHozqj2/N0KomcDGrteBRUKft2qi7L9zeJgjZ5ZJJ0v5EY9xwvavM3denpNbiohuWGqwr+yaxZ+KNZVCiZ3VyNASeKpOP/88Bo+qCpAPtzTPfIRCe4X81OeZwwcmNNrU+Bh6w1DFpr1Xv4orWgm0l2SQ6HCQfH9D+BtvRCnKos7f2fPX4qGjuQcmr9jLyceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzS25Q1vYQWuyYgqh29wH5T1BN/w50iEhcCcBXoVMRY=;
 b=B97OtGo8zW6m5ERrodtHkUWcnak3WAcjOCR9hXict2F2sRIoxpZenDHewjQStXCqwzEpMt14ADbd8QRpFySaLKxW5Q0117JecsebpTJR6Lyj5hQMkLT/MAWYH1eQKy8p6eluxI910Dv+Bu+XNoRtUdLpih3OsosViVTDTdFaE/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AMBPR04MB744946.eurprd04.prod.outlook.com (2603:10a6:20b:787::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 12:10:21 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 12:10:21 +0000
Message-ID: <49266b2f-b949-46ba-a87a-a4bfe454f10a@cherry.de>
Date: Thu, 24 Sep 2026 14:10:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] docs-wide: recommend a minimum of 16 CPU cores
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
 <20260924-min-cpu-requirements-v1-2-003fc136e9c4@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260924-min-cpu-requirements-v1-2-003fc136e9c4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AMBPR04MB744946:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f952ad-e518-499d-3b1e-08df1a34ce42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|3023799007|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	ujQBbTOkV/0derPCE0i01zCWpl4uJLjRSilGmo3ee3eTHlqAgvJXJsLBBhexW17S+Q70FcT7ueZCIRjtM0Q/KQUF3iWikhjfdFxRrp5X8sQluO2GZ2DVwpNfZSmX3AdDPGwwoaaT7tl8u0P1D4LXIv0Y0KxQf4JjFyx/huF3yfhEfX4oQFPJ650KoKfk9va74OPtcg3iuI6tyW8fO+EvHxWjoGprFO8knmphMSuYrzI3gCK134cPM1sA7i1joywJ8kIFT9QsP2Zkq7y0hYiaS5fNF6Hr8Kb/oJYHHKqXMRvv/EAuJ/ZcupAqYlh0oAoVw+W/hpHydVoGa+rVU9CaDCHBFVv3m+b4SUSGZE5l16sGUVbsK60pqgcgX+VNMcYhZ6V3YeM9t7IrkDyuLk+696eoX4wuTDKY/Dlj5+tH8sKtW83sa3D+jK8s6NckaBlo2Ay0f0g+AaoQSXiOGw+9Iv0qdZvtT20If/75XwKQpUn3JXH7IghK2qpusWRvSJkyO1SznAYVe7L2x/gl19i6bI1a1zjPjQ58oA9wI0UMbfWyrlp+1Fz+exglVo2OUraRvkLQiUFrLwczT54v7eZ/FNKWYZZ1MA7sD/bouYO5z0gWOq18EmliSo/n6HK9OeD9nWlMX7nUYyI4428ViHrr2nMrBoV5A+6G9/o6opZ9n1s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXVrSTJBOGxPNzJRczRvS2h5MEhPUTFUckhYTkQ2N2RCVG43ZEZkRFZCdUN5?=
 =?utf-8?B?MXo0QVh0TnViUkt2dFExZzE3cTlzN2crMjFFbWtZSGRjVVEzZ0hqck90Y3F4?=
 =?utf-8?B?OXZwOHFtVVJaMWR5Slk4MFM0YUhMd3NFeldzaEJCZGJYMThLZTlTU2d0U2hv?=
 =?utf-8?B?L1ZieDhDWUpBeVNzc3hJakJzbDZUL1RDVmFTd1paUzNwSVBjckwyZmIveVZS?=
 =?utf-8?B?WXhhQ09PSytwOU90ZWdKcWVhNHZhQU5IQk4vVzF0dW41RWI4YXNkajNlSG0v?=
 =?utf-8?B?REt3cHp6ZEs4UkF2MnlOeGg4SmZSczRPS2FLVEVtelphQ1AxdmFOZFE4VTE5?=
 =?utf-8?B?M2YrdWVLSk5kd1grM3lWeExQVVFyRit0aTI1YTRxc0YvV0FxRGYrVllNaytP?=
 =?utf-8?B?Qjd1RmoyTnRtdGh5ejN3c2p0RjlSVDY0TG96YXlqZ0pudWFMMWJia3RXUndK?=
 =?utf-8?B?Q2J4R3VHeHFGdkhFQyt4MG5BQ1NCMndrWlh4Tng2eWxKVmJMRmZHcmpsK2tj?=
 =?utf-8?B?ZWM0TWFlQnRMZ0ZYdUUva3d4Y3Z0YkhvNFZrSTJaNzR2Tkw5VzlwOEc1UGZJ?=
 =?utf-8?B?UE5mU29oa2tiay9IY040QmpYQmVQQTVhbHlGWGtYR1VpMkx5NWxDSUJpRG5w?=
 =?utf-8?B?bDd3Y3laU2JYY2V0eC9KTmVsbjhFZE95UmNoVzN3TjUzS0dWeHk0RFR5MitJ?=
 =?utf-8?B?MWZoWlJERGh5OWdVZWVrdHRIeUJpSDV2NTRudmJ2c3V5WUErRTdhSUozMUdF?=
 =?utf-8?B?VUJwUE5hOTI4K1VDNmk4eFNJdlNsZVZmb0ZtTHNNZDkzRlowVGFtVXdYdytN?=
 =?utf-8?B?OEhaaE1PUTVqYmd5aWpTTFFHaHdEWnBuT2NRRzhvKy8wejRvVlJtTkhHVGN4?=
 =?utf-8?B?c21BQlZ0dVBXWmhhS1YzMTY5TE1CdU1oWWRqbkhnaDlxY0xsVHJKVG5YRUZt?=
 =?utf-8?B?NkpTMFd4bUhpRDI0RDhUMXFRZityQm1NN1EwcXBacUhlVXJXK25kWEVoazJZ?=
 =?utf-8?B?Si8wQVYxK29lNjRzVjRkSzIvL3NXS3cxcjFzQklyMW1UaDhXdVFVVnZUbFFY?=
 =?utf-8?B?RW9aRTljamJKV1ZNUmppR2V2SG5jMHc3aDc5cXQ2TStDZklEemt6c25RbWNl?=
 =?utf-8?B?ck5Ob09BSGJvWEFubGZCZGJEQlA5OWJSczFPZFFDaFRzdEo1MWIvaDZPNTVM?=
 =?utf-8?B?RGFKZDVxeTRwTFlaY3NXd2VkVkZWM3BMNyt5aTJJa1I3Q3FNdEhwR1JDZitj?=
 =?utf-8?B?SVJxWVNwOWtFekhSOERlY1VZekN1TlhMcUErQ3RaNStKdnBHaDJCNzYxc0FG?=
 =?utf-8?B?RXdOSy9zK2JZQWhVSmRwRy9vNHJkNlBIV0QyaVVmcWlUd1pEMTF1R3M4MkJC?=
 =?utf-8?B?MnFmaWkvNWNTbGhCbXZHZFIrWkg4aDZKcHFGd2FnZW85ZUhlL1l4S2tERXJE?=
 =?utf-8?B?N1MwdGU4QmNnRHNrVExxdEx4aW5GdG52Y0dDNGFYVXhOY0tHdFpodEtSSFpV?=
 =?utf-8?B?WDdYTjhmNW1kZnUxeDduR0FPRTByaVE1TlVJQVJEdnltTm9ZMDZib2JnVHdV?=
 =?utf-8?B?YUtQK3AzMzVYc0xXWjJ6RFhWZFBmLy9uemhWWWdmdjNyYUNVclVsSjVWM3hK?=
 =?utf-8?B?cytIbDRWblgvVnkzb3cwMnY3QjVLRVg3QklXaEJzUHBBdFM4NmlkYjdveUdw?=
 =?utf-8?B?NmdRcFc0TFFjOG1sMXQ2ZnY5SHAvblMzb25aaDNsNmRjM1Mzd1dIN0FCN0Nr?=
 =?utf-8?B?M3R6MXFDdDgzajVRaGVEUUtIM3MzRlZueVgxY2MyRWlXTG1LZnVxSmJCcG9s?=
 =?utf-8?B?OFkxWHJtVmV4UEVZRHljdTNkZk04MUZZUGpaTjFOSkhMUnEvZmlNWEVyK3Ri?=
 =?utf-8?B?OEpKaEE2OVpDSEt6dlhmN1RCdTZCSVkzZmJPOEpNekpuUkNDUkNkMDlhWWNR?=
 =?utf-8?B?cFltVmNieUFHMEtnK05DcUVxMHk4anZmWEFPYlF6aDZjVU90c2VPaUIvbXRG?=
 =?utf-8?B?RHFLaVQxTW1rMEljTVM5S2MrL29OK3hHMGs2N0FPdklidEdZblF0T05vTHZa?=
 =?utf-8?B?RzdrRkhucUs3Q3BKYmZQL0RGZG5TMFhUYzBGNTl3MGNsakxpcEhEYlNlWWpr?=
 =?utf-8?B?Ny9vQ3J4QWpJU1p6bG5uSEF6ZkdxMlZsTXlZVjFGenhIU3R1aTlBY2hPQU9T?=
 =?utf-8?B?N0JEOTNaMlp0UWE2NnI4UC9IdUcwdU1IeW4vT3QzMVBLcjZnL1JmT3FhL0tm?=
 =?utf-8?B?cmxZaUoxTHZXd0Q2U0g3c0czMFRWWVVRaXd1Q3dneThxTndtMllSVE9iYUMv?=
 =?utf-8?B?YWpkYzVGNHVtd1grNWlkdENuSDEzaFM3cXRITXNjSmtKNUpvZUs1dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f952ad-e518-499d-3b1e-08df1a34ce42
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 12:10:21.2152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ayu1H1u0zg7eir+KAncLFSuJFvad7V9POnzM9Pqc39QkTe+YlsZ7R1RJdOyIAZwB2tjr4yyw18z1dwY9YNxkxfx1VRbMg4BIqujm8Fuznx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB744946
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 12:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10615

Hi Antonin,

On 9/24/26 1:48 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add the MIN_CPU_CORES macro to poky.yaml.in and use it in places where
> we list minimum host requirements.
> 

Are those supposed to be real cores or do we also count "virtual" cores 
from e.g. HyperThreading on Intel?

Can you link at where this minimum number of cores comes from? (ML 
discussion, commit, etc.).

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst     | 6 +++---
>   documentation/dev-manual/start.rst               | 3 ++-
>   documentation/poky.yaml.in                       | 2 ++
>   documentation/ref-manual/system-requirements.rst | 8 ++++----
>   4 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index f7e4606f1..dcdf7803a 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -43,9 +43,9 @@ following requirements:
>      much more will help to run multiple builds and increase
>      performance by reusing build artifacts.
>   
> --  At least &MIN_RAM; Gbytes of RAM, though a modern build host with as
> -   much RAM and as many CPU cores as possible is strongly recommended to
> -   maximize build performance.
> +-  At least &MIN_RAM; Gbytes of RAM and &MIN_CPU_CORES; CPU cores, though a
> +   modern build host with as much RAM and as many CPU cores as possible is
> +   strongly recommended to maximize build performance.
>   
>   -  Runs a supported Linux distribution (i.e. recent releases of Fedora,
>      openSUSE, CentOS, Debian, or Ubuntu). For a list of Linux
> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> index 5f0bb37b7..8fa32d473 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -56,7 +56,8 @@ particular working environment and set of practices.
>       get the hardware together. Ideally, any development, build, or test
>       engineer uses a system that runs a supported Linux distribution.
>       These systems, in general, should be high performance (e.g. a minimum
> -    of &MIN_RAM; Gbytes of RAM and at least &MIN_DISK_SPACE; Gbytes of disk space).
> +    of &MIN_RAM; Gbytes of RAM, at least &MIN_DISK_SPACE; Gbytes of disk space
> +    and a minimum of &MIN_CPU_CORES; CPU cores).
>       You can help ensure efficiency by having any machines used for testing
>       or that run Autobuilders be as high performance as possible.
>   

Reiterating what I said in v1 from Robert in case it was missed (not a 
blocker, just a suggestion), I think we could simply link here to 
documentation/brief-yoctoprojectqs/index.rst instead of duplicating 
instructions (and forgetting to sync them in the future).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

