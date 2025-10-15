Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B96CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:37:32 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.web11.13889.1760528247825159612
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 04:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Sxsd/rWC;
 spf=pass (domain: cherry.de, ip: 52.101.66.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqiQ9CZPNotHIO/B5gY+xuvWrd+ORmKwBbhEtfRhar7H8nbIYZc/tyCae3eXUTKEFO9wh/PvLmcIqoRg2qR5Jm16tpfS6BaTlYDj23DgTbCxwTfs+kGmX0Gr5htjin5rCfErsyIQIIc42qLX0GczjSX3M0MOLlE9ksz8xE1eZrhc6/lhe9qvCryxXzVjNT1BiiiIcp9fXLxIueHBL+ypvZOGN61pUDARfsffFj9Q10/hYq4sNBuYapxVJoLAP7tmAtMY0mM364xIPMCFSTAP3KviVnRBjcQmgqeMwsP7ZO5S84ta15bHt8uRRl5mrdpNekKoTeFgBuetQaVYkJ33eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sNdKir88QbA+h1hL8iiUSxhs7wfICyoVes5mR8QoTg=;
 b=MImt9/qX7H38DgrbQtHIDn/oHTqhxFSPYZ2KGGmFAD8/Ej3CWWiZrPHVt7TOXNN3n7+PRevVVSzlZ/ZBI2C7Iw5/NGv/TxAaZbTWBUtbtNXYctBWWY3greWO5DqbN+GGJZoc0yNaWI0YZUiEriceRRYeWzP8QrwI9WwDEfrNT9NflkftX5wVkwx3PDp5adMPmYr5P2fsU+gjmMsNvM7i1JQnvDJQ5uMTy8O7owUYAWTGYHxXzjMxMkmISL0Ff8+mfV/Ivx2kk4Xo0A5u0ATg6WVOSDE7MR5WyG7LhC/vH3eTuVmqBGndL37Cj4IrWw87PoKEnDopmgQqGkIW3cPsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sNdKir88QbA+h1hL8iiUSxhs7wfICyoVes5mR8QoTg=;
 b=Sxsd/rWCHKcisw0Ikpjhnd+OjrI6w3Ky/01EUD4u2FJ9cucXdSLIh6hlPxuooZrnCPotUQeUlnNzIDM5sdsg50yPGU3vaoGktScfikYdDMN13zbPoaNYT7A0VR2cRqkSCWvNw6fcYIpRu2AbNhIyy60PwicmI32qPkpmIZbi3YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8707.eurprd04.prod.outlook.com (2603:10a6:20b:42a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 11:37:23 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 11:37:21 +0000
Message-ID: <300758b6-f05d-4178-b8ef-00de46e07fca@cherry.de>
Date: Wed, 15 Oct 2025 13:37:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/3] tools/build-docs-container: build in
 separate directory for each distro
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20251009-iid-file-v2-0-715d527457f0@cherry.de>
 <20251009-iid-file-v2-3-715d527457f0@cherry.de>
 <DDHXSDDQ1EBG.5IL8Q984MU8S@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DDHXSDDQ1EBG.5IL8Q984MU8S@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9473f4-7654-4bf8-ec8b-08de0bdf3426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?elRDY2E5bTBIU1RuSmpFT3hsQm5Ya1h5TW1TVURjSUlGNG1CdE9HVmY5Ykhv?=
 =?utf-8?B?bXNyOXlXRk4rZHdKSGNyODFBaFA0Y2paWndZeXhCd0I3K2ZBRnZqVEV2VDBE?=
 =?utf-8?B?NHpuc0o3ZzNyU3h6bHJRT3lnN1gvdXFpeUhpanFNNTBJV2pNOFQ1WVZjYnVp?=
 =?utf-8?B?eEpNYWVVQ1ZvSVdwUGFnTDhDa1NYWlpLOE1rdVY4akVkWG5kRTh6YTdVUCtU?=
 =?utf-8?B?Wm5LV1p5TU5YZko4cDJYU0RPSXZtbzkxRmhxa1Vvdm0vbUJZZU01UTdkazc1?=
 =?utf-8?B?QWNqWUdhd2tjQ2Y5R0JSd2pnSWdBQkJreUxwWENJRVZTR0xPdXU0WDVpLzhC?=
 =?utf-8?B?bHh5MTN3alRlUmFOYVYwY29jRm9RcXRxa2JSKzBXTk9zVloxcHJWN0pWS0N3?=
 =?utf-8?B?Y0ZFbkU0dllpZGl5R3FYd2dZOS9NeXhLdDUrRURxQnp4cnJPN2FtR0EwK0Zl?=
 =?utf-8?B?emVUT1Nib0NiR0JLUDFhYTRVSnRualhEWHh6eXNRR2RMT3lYd3QxUVZKMUJ0?=
 =?utf-8?B?dldxMWQ1ZXhIQnc0REJmQVRiQlBzQlgvNUVlMm9nUXBneVJvRzZTUDJkZHE3?=
 =?utf-8?B?WHo5bnAwRTNIU1RyaTdsc1dwWkFTTjlwc0RGTmJZVVFaQ2QvTVY5ZzBpQTFo?=
 =?utf-8?B?UWtuM3JEVitWTlVmNTczbE9yaW85Z2UyeFFVU1FnSml6SnVNcHRvOTZNbGtJ?=
 =?utf-8?B?cTJEa1RGbURGWi80d0pQZmNwOS9rR2RobkZYZE1JTWJ5aXArQ0RndWloeVhI?=
 =?utf-8?B?QTRwSVlYWnhFcWsrWk1HYUFTcVBjRnRKeUowd1NVcmp4a2o3K2J6aHdCdHVh?=
 =?utf-8?B?NlpzOVlKelJjemRXamhyRyttNmFoaGRLVEYwNXFudmxEYmlLNWlrK0RSeUJy?=
 =?utf-8?B?VllFQXlXZlpwR0tiSGxGWUdCdWdrRWY5YXF2ZTd0cUZKaWFNbnhLcGZRaHph?=
 =?utf-8?B?b0JIem5kVWNwWXVJKzVSWll2c21qNlVrcmhUWnNDNXU2OXN4SEZXK0o0bHd0?=
 =?utf-8?B?eUw1cVRsamhza2g1MTY2SllidGxkWktEWTVpeHVTdEg1bStack8wZ0pzU3NO?=
 =?utf-8?B?OTBxWVFvVjdkR3ZTd2hvWExaaG1QL1VIQWpRcXhDb1ZuWHdGQTNDSmt0L3dh?=
 =?utf-8?B?SDhqTHJnQmRkMzA4d285V3JUYUpmYktvS1B2WDRCd1dtbXFRQTBZT3lrSkl2?=
 =?utf-8?B?SXZvRS91RHo3QWFOaFZKYzRsTndndWJXNnVuNk5oREhoc3pKdnVZRnlqb1ho?=
 =?utf-8?B?UzllaGx1Y2U2cnN5V2doczJ0TDhjUEt5S3R4RVpuc1BwZGg1bFNVTTNaelZ1?=
 =?utf-8?B?cnBrL3lIOVFBbDArRVgrVXV6aVJ1ZC96ZExZUnQ0aDRtUGZXUzF2Tlo0RVFH?=
 =?utf-8?B?bDhkZjNwdjdUMnFkcWVuUGpaZE8xSlQwWVdRZTJIMnVwNWt1T0ppaTNMcWQ3?=
 =?utf-8?B?T1czNkhIejhGeUlXdHdnVlBOb3UrMjkzVXZnQkJ6Zk5rWkwwbUxxeDlXbmh6?=
 =?utf-8?B?NFVsK1Z0a1M0TmpkMnhRT3NLUlNENGU4MmRCWG1wVndSNVJOTVA0N0lFdlZ0?=
 =?utf-8?B?Q21tbXZOdTNaSkY1SHc5Yk1NU1pIbTRlOE5HQ21IVXNkNVVOWUdibkdZbFAw?=
 =?utf-8?B?S2xnSHVxSHR0Ym9wazh1K0FadUk4R3V3NUYrT29abE9wL3R2VkI1eTFGZlFI?=
 =?utf-8?B?ekhwRTdNSm1zYUhLbCtPSHVITHkxWnBaNWNXczkvTmlmOU42YW5YODREWTFM?=
 =?utf-8?B?cG03d3VveUFHcVVPL2RmaVVFWkc2TlhKL1ZpZ0tON20yanNOdFJOTG41TElI?=
 =?utf-8?B?Mi9IdGZtbXNkcncrVzZ3NzBhY0tQaGp2SUlqcHI3cGIwWktPRnMzMURmeDMz?=
 =?utf-8?B?Y1dRYmJWeDBIdityUlc4SDNHU1UrakRpeDE2Q0V1WUNWbXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TlpVZkFqKy84d3dXSnE4SG9VZmVhWDdGSGRkM2Jka3FKdTZPblp0N3pQKzJ2?=
 =?utf-8?B?aE1jQWhBbGZZQnVsTGZUdkhEZ0ZDZnh3QjdyTldBdUFWNGJBL1Z5YStaZWE2?=
 =?utf-8?B?SmkvYkd2TWpJa0dkeGtTSUZtWEM4RmRMeGRjMVlDMXVFdXh2aU9tL2I0MmlO?=
 =?utf-8?B?Z01iUFNZSzBQR25qQmV4YmJFZGF4RGxZN1ZPNUtoZEVOWHZITVJXcTlINGhD?=
 =?utf-8?B?KzMrbi9wRnRpaU11RCt5Vm1Iamc3eExocDgzcHI2ZTVBV2RzTXhoVUViSjZC?=
 =?utf-8?B?S2U0SFZKc050KzRMZ0pkQjN1WllVR2RxalREVjlQWWRYY1Rvc0VyZGZKUnlP?=
 =?utf-8?B?TXdQaUNpdmdnYUNGVVZJdkVIWHlZNk1sbldEc3BnK3U4QVZRY0RRWjh5Wmhv?=
 =?utf-8?B?S2xYMWhJdUx3cGtwR2hkZzB4NlZpU0IwL2ZkRjhWZTdRM1NCTUFoRmJpYUdi?=
 =?utf-8?B?T29oOFE1VVoyYTluU0pESklnRFAzUDMzcWJCSGtOR3pmNzJQaFFHZWc5Z1BV?=
 =?utf-8?B?S2JvSlRsaTQ2VzJNWkQ2WW8vUk8rWHo4V1JmWS9WOGdiKytXNFNHeFg4QXdo?=
 =?utf-8?B?MVM4WjJTekV0cjIyL3c4MzdyWlE1TXlUb2N2ODhtK3ZHMHVVUnZRa1BaVmU4?=
 =?utf-8?B?cFZmbG9UaUlhOG56dEJSZlZJSk05THNnZURqeTN6SUVEUWg4TUhSaWNPWjJO?=
 =?utf-8?B?c0t6ZHBvU3NuOThISXdtWmNxeHBnTFlqRnFDREZJS1NFTk9mVnB4c0RuSmNn?=
 =?utf-8?B?dHVqRTJ6NEw1OUZ1Vm9LZW84cXdDY1NnQWQrSDM3djZEbnFreEZUMlFHeUlC?=
 =?utf-8?B?RE14SWRuRStrUEVFM1BhLzVMek1TZjBkamZjRFYySUg0dDZmSVljV0s3dS84?=
 =?utf-8?B?anY2cnlKM0IvZE5DSUdDdnMvL0cvNk85RmMvZmxVTUl4TmZwVnBLcDJrMHM1?=
 =?utf-8?B?S3YrUE9VcDdGRXd4M1B4U2lvNFl5YUlZNjViNUY5OGxMV1FUTkN4a0J5WFda?=
 =?utf-8?B?NC9CcWJmZzF2RFF5SmtVL3dKZTAyamZjWHlWVHF0ZU9ic3E2SkNqSE4zUmVW?=
 =?utf-8?B?N0NoT0FsU24rdDl4Y250UC8yRDlSODVYWHBkZHRLbVVUdHJJOTZLVnRKYXZT?=
 =?utf-8?B?ZXZ6eUpXQzFkREdLSGVYdmVoTk9FMkJPK0xuZWpMaUlzQlVBVzhzZ1dyY1ly?=
 =?utf-8?B?UFRzOSs2OGtQVTFOek5wMks0YnFXc2JYczFQWTFRUTdEcVROOWtzcFdzWGYr?=
 =?utf-8?B?OHdPK0dwaW1xVk9rZjl2UHdOVFJBUzd0TVM2MzFkNGJORjh5ZHNIb3pvZ2h6?=
 =?utf-8?B?NDBMQUZPN0UzUHFjc3BXUk1YL2FTZS82MmZJS3EzcTZhakZqeWV3OFdOMDNt?=
 =?utf-8?B?cCtteXB1VFV1RVRnZkllRzJVMUhXN1FYRi9hQ1p5Rll3a1VlNDFOeCtuZ29J?=
 =?utf-8?B?c2FFcUNuOXF4NnZjcHpISUl5OG1hVldOYTB1dTBpQ1JJcVNUYVZGdkVZUFJo?=
 =?utf-8?B?M1g0SEVHQkVjcFhtUllzS2lIV2NzZU1PUko0Vno4SFd6MmtydWJjZGxES1NT?=
 =?utf-8?B?UGJ1K1NLSGNuMjhKbUJpeHFBdm0rUHo0MzJZZW1QRDY1UFIrZmZjRDNrTEZ6?=
 =?utf-8?B?am5xMGo5K2dHVklUVVpRQWVibFhRell5dTByMEFYVERNWG5TUkdoMWtEQkdr?=
 =?utf-8?B?NEU2R0FLYnQyd2Q3RDZpVVdNWDEzRTIxWnhML3hqcXFDcHBxQjRVejZxaU9J?=
 =?utf-8?B?cGZPdGp2SzA4cW9CRXJENTE2bTlZS2hyUW54WSs0aU1ucnROYjMwMEVRUnVs?=
 =?utf-8?B?SXRRYk9XenRJWCtyN285MFFocmIwRDFPek00YkFrc1k0MTNrQjFkRG83YW9C?=
 =?utf-8?B?NlNCZnBOM1ZCVHFSU3NjV010SjluOGhITHo2QkhQWktHRzlnbUxPMlJGbnk0?=
 =?utf-8?B?RDFVM3BMamZKMm9jVmlIYks1bVBESFBoTkt2dDNuajVEcFhlalZhcjNhUld3?=
 =?utf-8?B?RmlkR1Z0U0dyM0tSOGxGZEJnYUlsWVBFUGpSZno4MmwwVkVxNm5EZE84R0NU?=
 =?utf-8?B?RCtrZERJVVFwVUFzUExTeGk4TWIrem95bnNFalNHUEJpMmU0R015aHd1SEU2?=
 =?utf-8?B?SnZRTEVURDljakpySE11WmdHVHdITm9lLzBESGEwQ3RrcW5NREkyeDR6TWpD?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9473f4-7654-4bf8-ec8b-08de0bdf3426
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 11:37:21.5780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I01w6hyeBrXv+LEcGeGmVeMADVsamkX+VOo3CRd4X9/KMbqHgpn9U/lJ+lxSV3PS9paVqUtzUk/YRaBj/GVs3Y1F2YBm3MN7ILSHpdjNrfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8707
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7701

Hi Antonin,

On 10/14/25 11:27 AM, Antonin Godard wrote:
> On Thu Oct 9, 2025 at 12:24 PM CEST, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> This allows to compare build output from different distros if necessary
>> and make it easier to make sure we start building from a clean slate.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   documentation/tools/build-docs-container | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
>> index 831d357fb..47320e182 100755
>> --- a/documentation/tools/build-docs-container
>> +++ b/documentation/tools/build-docs-container
>> @@ -60,6 +60,7 @@ main ()
>>     fi
>>   
>>     local image="$1"
>> +  local orig_image=$image
>>     shift
>>   
>>     OCI=$(which "$CONTAINERCMD")
>> @@ -159,6 +160,7 @@ main ()
>>       --volume="$DOCS_DIR:/docs:rw"
>>       --workdir=/docs
>>       --security-opt label=disable
>> +    --env BUILDDIR="_build-$orig_image-$image_sha"
> 
> I think the idea is good for improving concurrency, however I think for
> development it would be nice to keep _build the default. What about having
> the following default behavior:
> 
> - Build in "_build-$orig_image-$image_sha"
> - If "_build" does not exist _or_ is a symlink, create or replace a symlink to
>    "_build-$orig_image-$image_sha" from the previous step, named "_build"
> 
>      _build -> _build-$orig_image-$image_sha"
> 
> - If "_build" exists and is a directory, leave it untouched as it may be
>    originating from another "regular" build.
> 
> Then:
> 
> - `make clean` removes "_build" and "_build-$orig_image-$image_sha" (when
>    "_build-$orig_image-$image_sha" exists and _build is a symlink to it)
> 
> - We could maybe also have a "cleanall" (or name alike) that removes all the
>    _build* it finds, to clean everything up.
> 

To make sure the make clean still removes the old _build directories, I 
think we could simply build in a subdirectory of _build, e.g.

BUILDDIR=_build/$orig_image-$image_sha

then make clean should work just fine.

> With this, additional runs with different SHAs will just stack next to this,
> re-creating the symlink only when it is not a directory. This way, I know that
> for any previous run of build-docs-container, I can open the "_build" symlink
> to get the latest output. Of course I need to be careful when running concurrent
> builds, but that is another use-case, a bit different from day-to-day
> development IMO.
> 

Mmmmm...

So I think we could make this concurrent-safe by using an flock on some 
file?

e.g. surround any Make target that modifies the source directory with an 
flock, something like shown here: https://unix.stackexchange.com/a/382916

And actually... I think we already have some issue with concurrency 
without calling make multiple times from the same tree.

I believe when you run make all, make will run make html, make epub and 
make latexpdf in parallel which will all call set_versions.py which 
modifies the source tree. Same would happen if passing multiple targets 
to make (e.g. make latexpdf html). I don't think the f.write() and 
w.write() in set_versions.py are concurrent-safe.

> What do you think?
> 

With the flock above, we could simply add the creation of a 
_build/latest symlink which points to the last make target that ran. 
Maybe we want a _build/latest/html for the last make html target, 
otherwise imagine you run make all once and then make html one more time 
for another distro, then _build/latest will now point to _build/distroB/ 
which didn't generate the html part). But that could also mean we should 
split the build directories for latexpdf, html and epub so this works... 
but that means not being able to reuse the sphinx "cache" (I believe 
there's one to do incremental builds? maybe it's also used for different 
output types?).

I think we (I) may be overengineering this a tiny bit :)

I think we probably should add an flock at least for the writing of the 
files by set_versions.py if that proves to be an issue (testing needs to 
be done :) )

Cheers,
Quentin

