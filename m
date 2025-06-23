Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C2BC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:27:30 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.44])
 by mx.groups.io with SMTP id smtpd.web10.21228.1750688846537909047
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 07:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WVvAhytm;
 spf=pass (domain: cherry.de, ip: 52.101.69.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQywMheJSaykjUP3+EHGEOs2F1S1dwRf1E6rbS4/wsgSgU+iAreDFHewwMVeLBOAB08tZhl9SL8Z4pLO/Bh9DBy0Na6tgmQW1XMTspt1F7Wk+t852v8YRqd3G8k+KNbs/jgYbs1imI5UsnJ6xwkbHOevsv0TZssLhrlj8PuRlc7hnEIdk3A4ITC2TnX8+tu7uX+GtjXJqy2KLTL113NjcUgUyOg8ySWPwo3Xayfn58F8dHTnziJiH2jXzy1+9zr3S9rWeppHkcxAdwde7mTsAUlv+rGjPztuNZ8Ki0sEgYttG62ARscreQ+xI/qVwXBHD05kT08RSKfN/izZLP1kYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ4beonDgGH0951LF5Ffoajz+OaDGIB5b/2CF8qENrE=;
 b=aEia8nFS0M2QFoUuI9IanX1raPficFq+sEXjN//QZ8JgW8gnblccXW+ckpi9Ta4IdJy6SNlTir9DXl1k45cotvG2FRYcpsMR3tzwavZ8SBWVvVV86QRanqjGP/GKxamtAais8ezXhVNqq/oBBLIC102X4dGsoMPwUIO8OYK8RGmihz5MPzu1Wxti4DJ8VEXyV/czqzR4TZftyHhsWzlmSoKKexjfQShj5ZOnQOgzNst+6/ZhgG825zgsc3b8ahUBfVt8xpQiEOgfa/AALzxMCWJ/4+lfyGygv79EakBzZtJsef3gvGri4EcP+F5hUseH1nXngXrhjCuIuqq81/dZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ4beonDgGH0951LF5Ffoajz+OaDGIB5b/2CF8qENrE=;
 b=WVvAhytm1XQvPHOEG//3GBX1UTOIuTj1EQ5TASPsrZP3RfiYAHMy4OpF8mRUKfFyPARs7zq+ZWMA7ynX6OS9DVPSJ2n42vjZU/uT07qa+HkqqDYrlUcEUjFHnkB+tlHizKDKZXPKmCGFYPc7wyjYGY9v/b3u6pHvwYjjPJgbBug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8575.eurprd04.prod.outlook.com (2603:10a6:102:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 14:27:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:27:22 +0000
Message-ID: <fcefedca-075c-4213-bcf1-7770ea16a9dc@cherry.de>
Date: Mon, 23 Jun 2025 16:27:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] should page on "Selecting a Device Manager" mention uedev?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <3ee37427-2257-90a8-4ef7-03e344f0e671@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3ee37427-2257-90a8-4ef7-03e344f0e671@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfc6bfb-b260-46de-5cf7-08ddb2621176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S2VTL1pvLy8yZkZta3EyWjZSTU1LSTArOFgwb3ZrLys3akdMMjlDdzNGQVU5?=
 =?utf-8?B?RGVZck9NZGFiZTBUaUZ0Y3RMZzlKWGYxTlZsc2VjTW13a3VOY0hkTlp1dG51?=
 =?utf-8?B?aVcyUVY2OXFBQjVPbGNaMlJXY0VoL1hkWEhzK1phOFVUYlhNTS9GQVpDdG9x?=
 =?utf-8?B?dzRZTFp3QytSYW1zbDNBQlU1RVFjdzJCalRreTc4bWJnWEJLQmRlakloYk1U?=
 =?utf-8?B?T2JndUxrZzAwVTFjcGhDT1JXSTY3NCtYV3E2Mks5WWhINnVhS05zTVN1dTVD?=
 =?utf-8?B?TUY4R1ZiQjZIZ0tWeldXOHhNbENnbGZxMVBiV2k2Q3ZLSEt1bTB6dko5TUg0?=
 =?utf-8?B?RnkzVVE3RUx0NzZtSy91Tkd3RzhpbWg0VEFpUGgwR25SRnV3R2tZVGI2QTcw?=
 =?utf-8?B?N2dzSXFsN1RicDFDejdmNW9UY0syays3eXczY3ZqUmFGRzJmZFpXSkd1R3VY?=
 =?utf-8?B?b25lUWdJWU54emxhekYwNDBnK1Fnd2tGWWpWNU01T3h0QU9kMFdZM296S0Z3?=
 =?utf-8?B?dEpXOGQrendqVGVNNDZvOXIwdEJQbzZ3eWZ1dFJ1ZGVrakhFV2t4WE5JRG5P?=
 =?utf-8?B?Skt2ZXgzZ3ExTXJDc0pPZUxJWXg4djlqYTVhdWVsTDFsNEVEbVdJQ1RTSWt4?=
 =?utf-8?B?bVEwU1Z0VXdyazl4ejQzSUVRZGd2OUxIT0ZWcFFDcmV3aklHNHd2cDBsNjBy?=
 =?utf-8?B?K01RNEVidHhVVGZQMFM1V3FCcE1rKzJwUHhmb3NNamI5REs0ajFPNVVMY0lJ?=
 =?utf-8?B?YkV3MmdJdVk0K3lBS0NyU2YrdVBqaWJBRWc1TXF6bldubUN6T0FZcXptUVdB?=
 =?utf-8?B?U1kxd1Y4UHorNEhjZWwvMU9qcEwyMmNmRW1FRGdyYkl5alI4TFZ1MDhyRG0z?=
 =?utf-8?B?WVdjS1VNOW9UekdFZmcxRFFRQ3lrN3Q5WEpLN2ZaSVpaNFJ1ZU14TXVCMU85?=
 =?utf-8?B?MjFNYzdvenJrYVd1SHNuMnBuUUwrTHNpT1ZYVUNHZC9sVGt2ZjBoWFJsRUNO?=
 =?utf-8?B?S2lKcjloS1hiM2J4RlViZGZYNWsrUXRjY0NwYWJRaGRCMmNpb3YrUUIxYXp0?=
 =?utf-8?B?dmdldkcrbUthZE5jVERuRVRlV0wrS3haV0hpK1RFbU5mVzVKcjNNckJHeUxk?=
 =?utf-8?B?YTZUUW0yWVY1NGhMQ0tLRkwrZnZ6YjVuVDJ2bEFITkNYQWk1ZTJsVnFEc3N3?=
 =?utf-8?B?UDlFWTNOQWRJc1dxbzJYYVNYLy9BM0dKQ3hWVzJYdWNlWjJnN2E2MThJckFG?=
 =?utf-8?B?d25OQ3FaQUl4SkNNamw3UzBXSTQxK1IvelVFTGZGemFSMW5vMTc5U1d4aHYr?=
 =?utf-8?B?L1k0ajRyWlhVenlMdjAxbk1mWlBYQWhHNlFQblovaUd0TUFpUndTMkFabDlU?=
 =?utf-8?B?T2dkZHdWN2xvRERJa3psdWUvNVpBdWNYVXV4cUdTakFBS1QraElsM25pK0JP?=
 =?utf-8?B?dUpRNndoRncyQ1R3bEdmYU4xN1pSOE5BclFCRTNhZ3NqM1A3a29sRmFxbzFh?=
 =?utf-8?B?YmJLY3VEazEwVDR6SkRhZ1BpS0tVcG9rRktUTkU0SEVtNmhkYmlCY0VHWCtM?=
 =?utf-8?B?RzcrcnVTaml1NEp5c3ZjL0JsTWFxQ25oMkxGUlBUQVRKcXJLSHZHcjNhbFpZ?=
 =?utf-8?B?cWtDdmUwS3JGKzVISEVOdVRaTldRY3MybmlpQjV1WExpZG5LZDFJWDFRNk9C?=
 =?utf-8?B?SkhRbHlTL1BRVlN5NkJaRXdoNnZnckRpbGd1SlZaQ2hYMGg5ekFjRTZTZVp2?=
 =?utf-8?B?Z290bjArbUd1Ym9jcXV0UnZ0M29aWUNNZlUzOHZURzdHTkQxa0V2bTFmMmRK?=
 =?utf-8?Q?WLMwr/gBouMCf90c0m7I2g2K/xCgoNBvKjAgg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UEFvMUFNempVdERWWGtPdW0wMThXY3pWWDgwaFl3OWx5eitGdDNWVkQ3Ui9r?=
 =?utf-8?B?TVBRejZ5dStzL1QzS2J0QTMycWNIUmVrdThkOXM1SGpNS0RRblJOd3ByZkd3?=
 =?utf-8?B?d21jV3FDTGVCSGZIMWNnckk5cTZIZVBURGlFODVRekErNjJGREsrV1ozUXkx?=
 =?utf-8?B?a2JDcEc0YWZrQWhMZnlJaG5ETnIzcnBURGFGcC9JL0ZtbGV1d09mandWbHV1?=
 =?utf-8?B?eFpMZWljN21DMGg5L1cveEkzZlI3b3NDbDR5OWZpaWpXWjNVbXFOTk1ja2tP?=
 =?utf-8?B?NHFTaFJZTUs4OWpMWHRTSzlaUGI2UDZqRnBia2RRdU94eTJJMTRYa3R3RUxz?=
 =?utf-8?B?QkIxZktQKy9hK2YvakYvb3I5Q3NmcUhVUXRlMFAzdUpncFBlbTVPYVV0YkJh?=
 =?utf-8?B?Q1FveEdpTGZCcWpENklwcjV5Vk1nb29ab2lRTWdMQXhodnB0NzY1bHI2QWFm?=
 =?utf-8?B?ejV2Wmt5Nmoram9paXVMb3FDWk4yYkpOWWkvUWcrcTNsa28wSjlJeDZFN05Q?=
 =?utf-8?B?NnVGbHdpdHBXbnZEcjdHbExTY2czaFEyZWQ5ODlkR2Vad1dmdXBzWC9ERFR3?=
 =?utf-8?B?WVk4VlRhekNkeTQ2RXQ3MzJnK1pqV0daUXBxUStVTkRsd0h2Zmp3QnhrOTRQ?=
 =?utf-8?B?cEVVcFFvRDFuelk4dVlIT0IvRGFuTTVzYjlhVE9oK3ZQck9LSkFHMDNNb08x?=
 =?utf-8?B?R1VlREZhUXo2ZlUwTGt6bFBxVXdiMFNISXFNNkxDbnprYW8vWWVjNmhhbkZx?=
 =?utf-8?B?NHEvK3pTNGt1dFBsejRGZDVQZEhhcE1pQU10cTVZbnBoSlRjV3ZlOGQ3b2pF?=
 =?utf-8?B?b3dodDQzODRRaHJ2STJ4eHQvNjBUR25HNnY0VlY4K3hkaE5hV1RNUURUUjdU?=
 =?utf-8?B?S3oySUhqdkNwb3NJMWRYUWR2L2h2QXVNUUZjRDJUWTVpOW94eVZ5YmlGVVJQ?=
 =?utf-8?B?TkRBcUhHOHJ2Vm82dGMwU1ZvQ3JvNFRpejZLOU9sRnFVRmZHbGFGNjBGVTlF?=
 =?utf-8?B?eFArbnh6Z3kvd3hBWnFNcDhZb1dObVZocTNCdkM0Y1YxL3BtU1pQQ1I2S0Y0?=
 =?utf-8?B?K0xEbE5HRDJSekpxdlY2YVJ2RXNXWHJOSmlJcm5lS08xMXpZNTN4elJkajZW?=
 =?utf-8?B?alprNFJwSzhmUWNuejNteXdjYnlXSGU3MENGVHlFdXpKZjFoaEcwblZ6VGdK?=
 =?utf-8?B?SHRxaC9XZTVWYWh4MlREdUp5VXc2MkRzdTVHUEdmUG5CQjM5Uk1tMVJDSk15?=
 =?utf-8?B?eW5JSXcreEZKMWFUNURyTGRqa1lnb0JENmgwRUlXNTFmdzM1WTJZUFV4YXFk?=
 =?utf-8?B?K2tXUnhQT0FCMSs4ajFIRGtvYUxKUXBrNUNvNjZ6dFA0dzhNMlg1bFVoamM3?=
 =?utf-8?B?cUJXUTdEQ0NVenBhMGI2L2YwK0p2em9lR2RCREVQN1psT2xvdWdXMFU2NFJ0?=
 =?utf-8?B?Z1lkT3RZN2gxdWpLa0VQMDJtRTNIM2d2TTRxYjlzWEJ0ZjRqajJWZEhWbjNM?=
 =?utf-8?B?UmlPOWhJbkpVdGI5UnFRd3dBdXdOVkxWd3QrMTJjaVNRcTZlZHBkVFFRT004?=
 =?utf-8?B?dCtCOG44WDFPS0lUV1E5K1B5MXZlRW1Pb2JZQnluQ1JCdFdtR3l1dmxFVzlU?=
 =?utf-8?B?VlB5Ukx0WE1LZVdjM0JzaXgyZ1JMaDU0TC9QU0JBaVFJRWlpSlhtWFJrdTgz?=
 =?utf-8?B?VnkydWRZR3dNZjdFOFJ2TnRBL1NBQmFDQjZ2Y08xWHlCbHhtc2NPcW11M3dz?=
 =?utf-8?B?aTU0RmQ5N1ZMQmtVWFZxWU5mb0RwQjFXZHJHKzdhekVWQk1LYXhvTEo1NU9J?=
 =?utf-8?B?Y3hwY0JFWGoxdzlYV2E2Z0NOVHFiaG8yWWVteC9YUGFBRFg1Q3I1Wk5zR3NS?=
 =?utf-8?B?SWg0djZGZlZ2M1RlSjh5OWp4blhYYlBBYko0NnZDcXlwNUxqeDNCcUZpdFdC?=
 =?utf-8?B?M2FSaXZUUUUwVVEraHB4c21xL1NKZTJkZmFCRXhBSEJacTkzQVpwZjBHQ3Nw?=
 =?utf-8?B?b2h4dmFGMGlSUnk5eS9pTDlVd3lTeWtSM0lyL2JFTi9rTjNsc083WCt0M0tm?=
 =?utf-8?B?V3hsUGZCcHBGdWF2dFNPRVBISjBtTTVFNU5PSDdmWnlzdHlYeVFCYlBCS2pm?=
 =?utf-8?B?RGJkMmNWTGQ1dExnbVVUUmRGNzFZK0w1SjVTeXVTNWY0TURyVHZ6ZHk3VWhp?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfc6bfb-b260-46de-5cf7-08ddb2621176
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:27:22.7368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6pSq22pnp+C0KD6ZEiyDMznFBxS5Mf6LPqLzFLOmYdo8doQwYsgFN25SIw71OU7j6yPm69pGeiSfZydf8WjraFiSAQS7jXgqbOvoKEr2co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8575
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 14:27:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7162

Hi Robert,

On 6/22/25 8:34 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    this page on selecting a device manager:
> 
> https://docs.yoctoproject.org/dev-manual/device-manager.html
> 
> says nothing about eudev. should it? given that both systemd and eudev
> PROVIDES = udev, what happens if one selects systemd as the init
> manager, but selects eudev to provide udev? would that even work?
> should this be explained?
> 

I'm pretty sure this would result in a build failure because you would 
have two recipes providing the same "feature" and BitBake won't allow 
that. How would BitBake know which one to put in your recipe's sysroot? 
Both? And what if they have files named identically in the same paths 
(it'll fail, I've already had experience with two different packages 
installing the "same" file and BitBake refusing to generate the rootfs).

I'm not sure we need to specify all device managers, but indeed eudev 
would be missing and I would assume that there won't be many 
popular-enough new device managers in the near future? SO it could be 
fine to add it?

Cheers,
Quentin

