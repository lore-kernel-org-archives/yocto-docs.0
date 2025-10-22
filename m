Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEF2CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 15:26:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.57])
 by mx.groups.io with SMTP id smtpd.web11.12465.1761146813718750378
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 08:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=j1gNOqM/;
 spf=pass (domain: cherry.de, ip: 40.107.162.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRioYBzN1aAXT2hCyKKmz47lWthhA9BKIZmohIQAskJKRHVNL8FmIRp0Ya6fKUvo6bd8q6GwkJanHJTd3T05vCH454gyYlh9qm8U0Poc0jNDYYw4sTsA64c8Ee/w+WnpZQs0XnmVYHu0giS+vThvcQO+n41Q3RwgRjR3Zdolp5brQwUaZMz2jxLgpVhty+YnX7+nQEIOr5p46ItLTm3ZfGTtsmDooixB4jUZQjoYyerugln81s/8fJbvHfV1hZXJ4aQnDvYPDD4DLzZ9wKFfEw3jcOrEGRpn+/Q++vSW/ZcJ8Ad76JJdnL+aLTgVI330rnaf1wo6IiIvXON0bBiDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lm2OBIUFN08qC4YAfwN45IJyTKS7XnxA0v1hXU4+r8Y=;
 b=uGOrdPoq/chBMijMDqZOu4nkMHDQ2DpwTRpp1k1GjwnL8spxPZkkuJO0G/XmusWY+3V/QzR+jw4sfmXUghLmejIsS3eP9Lz8W7ihZG1yjF/zOk2kER09mV3ffuTXZSc5ZKkJpTq64Gd8UK8Kq1YZV1fc8xaRkpwkvCqUpPLwyEnR3PJY2K+MsWwuReuaclbEmifVI4GAEkiU1ZhmiM6PogyLj8UljLqI7eETUSHh1auwhm0DojK+ROFuK+Is0mrPPb3lnxMmcSto9JA7cF8y7gdeE443aKhm+5KOmN+7Rz4xKv7CFWm71dKNZlrzAIxs60BcmHdI2rajEjSA3QOlnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lm2OBIUFN08qC4YAfwN45IJyTKS7XnxA0v1hXU4+r8Y=;
 b=j1gNOqM/uf9dhlnMu6tEQApA5ytRZUI8o1mWo6g+cvDDgrjRJ/Qdr0MrYhM8/dDkzBXdtIVZhcIvdsi73LkH/9UvDndFrJrO8UXmtRBXulqTsvfXlLi/1PX0Px+dJriW8O1TLg3wTk04sXYpmJRRsoFmJ5wqZIdirYQMho60CfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 15:26:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 15:26:49 +0000
Message-ID: <dfff1ffb-a7d1-4fa3-8267-a4d7fb5bd115@cherry.de>
Date: Wed, 22 Oct 2025 17:26:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] diagram for build hierarchy in overview manual seems wrong
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <6647a7d3-3aa0-5e24-edb0-8f9d434672b5@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <6647a7d3-3aa0-5e24-edb0-8f9d434672b5@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: cedd2dc1-3e56-4474-57e6-08de117f6b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHc3MXhneXRyOEN0WHBXVEtIVFAwZk95dDhYRTE5TGZONFBjK1R2bHRUd1p3?=
 =?utf-8?B?NHZrS1BGTk95c1hrb0lzOFhRZVA2MHBrVVZuTGxtdlVuRXhPUVZGdE1HbFYz?=
 =?utf-8?B?OUFDNEordi9VbXpnZEdEMUswNDNtSTlKbDZYc21ibzFLc3pTb2g0RHY0KytH?=
 =?utf-8?B?VXdqVDZ3d3dHU2IvdllJd1dXZWx0SEd0YlR3YkpxTWRkNkRHS1l5WDhOSkVr?=
 =?utf-8?B?bWJpK2lYWndETlF0RWcrSkp3NVlwZ3lJOCtjeUlIV0VtaHFSTU5CaDdvRjVl?=
 =?utf-8?B?TmxQbjN6RzBvOUJ4Q29ER2dpWmlCVlp3bTlxY2tKdHNraHpTekhqWlFsUElh?=
 =?utf-8?B?V2xZY21IRVlwNEM3MlRyWko4eDArTXc0L2FpUGl0OU5Gb2tLOXBMNnRIQUlH?=
 =?utf-8?B?OUhkakVrZnp0S0dDOC9aSENmYW41ajMrRHRkd3hkeC93MHZscy9vSVlGMjFQ?=
 =?utf-8?B?K2w3bTVSZ1B2VldWODVURlZVdEZLcGh6dmc4U2NDaTQrQ3pGWTV6eGV5QzBl?=
 =?utf-8?B?VUFsMW4xUVpnRk5IR2lOSXVSc0VKcnEyUUJPSjhBOHVIUER1b2dTbWVmQ1R2?=
 =?utf-8?B?c0VVcE5Na0RNQVU1dnZUVXFTVlk3c2xBR1ZPdFYxZHJXZS8vTDZ5REJCVUt0?=
 =?utf-8?B?Mm5oeUl0ZXB5MmNXczM0azY3QVhSYlVaOHM4ZkRtNUc4UXBpWnZ5M2YycExS?=
 =?utf-8?B?UnQ2UjhpRDNOM3dBUzk2YUVadFdBMTZmZjJRdEhMS0pQOVZoWkdKeER6L1hP?=
 =?utf-8?B?SHFvMXREenRZaVVVbG8wZmdBbHZ5Z2pSYUM2dXd0WDBRbHVaU1V0d3NCcWlC?=
 =?utf-8?B?L0tJZkhPbEtsUWdCVlkyWHZIeUFSYmtSN3dVM0NySFQ1ZHdQL0dXWWNFdE9T?=
 =?utf-8?B?aWtsOFgrM0xibDRYdGxBSFd3eU1WbXZUT0lzek1yeGdoV2syZWIydXNnRlFs?=
 =?utf-8?B?VGRrdmhsdGJZc094bG1UNElhYWh2d05PVHlsdkRmTE1Rd3hvZTNOLyt0ZHpv?=
 =?utf-8?B?Uk02M3VibFg1M3U3clM0bUxYWkhOTXJBSnFrZnRSUUhGR2hiQVBwc2RzTkFJ?=
 =?utf-8?B?MVI3UVhlOU92STlYbmlCbE1RYTUwUzdTMDNCeXRpL3hmM1YyM0FBRDR4QUl1?=
 =?utf-8?B?akFiZ2FYMWthdk9SOW5DU1k4eVJFWjdrUzB4c2QrbGpEQW5XbWxMd3VTZ0Fo?=
 =?utf-8?B?V2x2c0Q5c0RBdXNEeXA0b3BvNkpWaW9SVUlGeHQ4RXpaMWd2YWQrMkV6MkhX?=
 =?utf-8?B?Si92SDZoVEhGaVNCajRTb2puL0gwM3h5bXczRm1UZ3BvM0xNQUVJamZ0aEZl?=
 =?utf-8?B?ODB0TERGL3pTelIxL0NhbzdaeFAwRUVMMFViM0xmTXpJMnVCcndpcEpPcVY0?=
 =?utf-8?B?WHZXNXpQN1JvRXBVNkp6aDQ5Y25OOWdhZ1NzVFFUaEpsUlJmbEQ4WUFKK0kz?=
 =?utf-8?B?eWdaMGR3NTQzS0pROUY2WlNhenk0cDhKbElVS2xJZlFsMlQrNjkwQTN1WVpo?=
 =?utf-8?B?aTNaRml3bTVRWTVBc29aN3JwUktZUytDQTlROFdOOU9MSFpOZUxwcjNqMWY3?=
 =?utf-8?B?NWp5OXk5TXBMc2NjOWhJYVFGeGlTOEt4UWttR29pSDRPbzk3NUp1UitZSEhn?=
 =?utf-8?B?Nml1OW9xazFONk5waGlmRkhzMDg2alIybnBMZjhLT01rOHhhZkt5QzM3WnUv?=
 =?utf-8?B?L3UrV05ObzVmUEtkSko2djVVR1RBS3BBazZKUnRnSEJNdFFSTTk4WnlTT0Yz?=
 =?utf-8?B?dzkwenp3M3VHZFh3QnI4N0pNd2JyVVh1NTgveUdCU0hCN2VxV1lSWmFGQXVE?=
 =?utf-8?B?NVcvbmNQMi9RWGJNRGZudGVMdFNWNU5TSFJhdmUyaTJxdGVyMDJjelk2WVZW?=
 =?utf-8?B?cnJnaldScC9SYXp0NzdmeHFmMkVrNW5WVml0UEpnZ0FwK2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDhNcFpYY2t2blJLWDVMc0tDS1ZFak5xWEo0WnAwc3NLT0lqWTdsOERzUHhZ?=
 =?utf-8?B?Z0FQZlhHRm1nZFFHQzhjeWFOTUMwY1BmTWkvZWtNUE1ySHhHblZoTTJMeG5Z?=
 =?utf-8?B?d0ZkMnczRHFmNGoxYU4reFh6aXY0RUVQdytrM1FyZjAvM1ViZmVJUDBuakJj?=
 =?utf-8?B?ZmxJcGxsaUwrUDhrTXpZOGtsOEc3a002RnRqb2NGNUtsZk05VDg4TnJSRFJR?=
 =?utf-8?B?cFNXTERrVWNTR2JacG9aN1J4dkNwamFkZE45bnlTU20xR2NDbEs3WVpiZFpC?=
 =?utf-8?B?TWFscE5Pc293Y2NRK09ST0o0QW5Tc2Zva28rUXg5NmMvckZFRTdSRU0xZm1Q?=
 =?utf-8?B?SjI2TGx6Ry90Rjc1N3I0OUFZOXN4QVVldTRNN24zVXdoUVZ1ODVxSE9UTzIy?=
 =?utf-8?B?S0JlK241SWFzYWVjWnl1ejlXYmU1TmJFUEkzMHNnNE9WaG1ISHlLM0x5SVVZ?=
 =?utf-8?B?bWl6MjV4SnhlT2szNVFINFAveEh4RFFma0xDVmZhTUw4V1pqN3IwUVpiZXhJ?=
 =?utf-8?B?NXJpOXlBV3ZkQm80enlQaG40ZytsUDlwTklzd055VmZIT1NrS0dPQ3AwNVhW?=
 =?utf-8?B?Rmd4MTljU2VXa1ZvUUQ5Qld2TEtrWGd0WlF4V3FFSnBnK29mc1RiRGhxYTlT?=
 =?utf-8?B?aUwxSUk1SjNDMHlDOWxBeDlVWkMzdE9YSHRzQW5WZm9JMXBpUWwvMnNsa3Rp?=
 =?utf-8?B?UlVnaC9mb1psZzd5UFVMYnNDNUJ1bjBSUEFoWVNxWXVUY2ppdlZKV0tkT1ZQ?=
 =?utf-8?B?bHd3VTBFOWhKZ1FWUFNOditWSFZxTDBFdHI4VUNlOUVyQUEyZFZRUFA4TUMx?=
 =?utf-8?B?UHJzVy8zWldMQXlFb3ZrR1I2S3UvY21tOXFuYWw1WHQvalFSeXczbzJLbHhH?=
 =?utf-8?B?R3Z3OTVnWWxUSzZhY2cyM2ZsWUgvTzhBMm9PcG5ubkN2T2tuM2ViNjJRNis4?=
 =?utf-8?B?MkFLcHltVEFyb2FyOHdmdTlvMG9XaGo1ZThLQjh4WjIrR2dUZEkwNG1VZVFH?=
 =?utf-8?B?dWpmYmN2YS9zTlpMb0JzamM0MUgzVDdrZ0ladHNTait3R0VwRm9ESnlyS1Ri?=
 =?utf-8?B?MjVRdG01OUgxM1dUZ3Evb0p5ZjVsNFBhK3Y4OGpNbXBlcGlDYnJRdytpa2Fw?=
 =?utf-8?B?MWlLL0FrV2loKzhOZ1g5eGluTEkyZytuR05ISk9jUVlnSmFad1B3WjN5aDli?=
 =?utf-8?B?STltbFRacW02ZEhMMzZ6dk1XZXdSdnI5SGZyZ0pRd3Y4MENJbVlVbURBQVlG?=
 =?utf-8?B?R3pqWC9FQjVhTzlQOTZKUkhCb2U3ZlpBSjJPYkVkdGVLSnFSbDZEMWU2bDNm?=
 =?utf-8?B?ZUJLMkpneCtpVEVSWkJjQVE5YjBzVjV0RzBQMTQ2bTBWNUx3M1F0TDI1cWZ2?=
 =?utf-8?B?VWFzSEtqTmx1bTFBN2YxTjdJb1NrOG9wUDdGdU5TcjNWQzRyOUl1VWJ2NVd2?=
 =?utf-8?B?V0N0WitOZU93R2lmdzRGQ1Y4RlcxRk1UcS8zMHUxVk5NbUJJZmtZWjdBZ29Q?=
 =?utf-8?B?UTdSY1NvRG9wTUpIRDN4MS9jSjdoM0ZCbnpDa0xFU29jcEZUNExlYlgzOWFH?=
 =?utf-8?B?M2dJNFRXb2twOWJBS3BGdHlxS0liUmJraS94eUxJcGdqU090cHAyd0RMV0w3?=
 =?utf-8?B?MGsyWXd2TTJTL2hha1ZESGxIY2tnREJmS010SXVNQXo3bFVid1VrUCtpaURr?=
 =?utf-8?B?S1VzSCtGSnZWWVdyVHE0UlFuNTF4WThxWFhwL085UEhwSll5YlFqK2NoSkND?=
 =?utf-8?B?T0QvRHdCVForc2MrV0JLNzBsMy9MQmRSaEF4cVNpTEZNRmh4QmxNU1dHTE1Y?=
 =?utf-8?B?V1JmM05uZE9rMzlqRjZqcmNaVEtGUnQyTW1VclNja251eW9tQndTR2xCWk9F?=
 =?utf-8?B?M3JFSVUyM2g3ZXNUNGlWMjlWSVRxbjBPYTgyU2RxMVdVUjN5ZHoxNHV6My8v?=
 =?utf-8?B?dytxTWJUaUZZaHd5eVk4Q05ad0hEOXRoK0lJaTJ1bGNhZy9Wd2tKR2lHdWxX?=
 =?utf-8?B?U1lEbHFEemNkRjY1U2dMdGNYRUdQSmJVUW5laEpkUTJBdklMK0p3d3BvWndi?=
 =?utf-8?B?Ynp3cC8wdzF0dk1Jb3p5YUZrb2Q2dGJXOXBwK1NGem0vcytiUTdOclJyRnUw?=
 =?utf-8?B?c292Y3BMb0ZPSithRkhvTDFXNmRsMFhQLzNjVk1KUi9lSk5tb0RVYlV5WHhI?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cedd2dc1-3e56-4474-57e6-08de117f6b4b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:26:49.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3buYl6qD7MgUiqwH90ymhgFsdCvv6O9pHNcozJalyAl09p3ojBDZF8LxJ9gdckHBHQmnm5Ihla9N3rWWPmAVgR7uVXODGWinQyv6l+Q7M2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 15:26:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7772

Hi Robert,

On 10/22/25 5:13 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    just noticed this as well ... here:
> 
> https://docs.yoctoproject.org/overview-manual/concepts.html#source-fetching
> 
> the graphic states that the default name for the UNPACKDIR directory
> is "sources-unpack", but the setting in bitbake.conf is:
> 
>    UNPACKDIR ??= "${WORKDIR}/sources"
> 
> where does that name "sources-unpack" come from?
> 

https://docs.yoctoproject.org/migration-guides/migration-5.1.html#general-notes

It is only sources in 5.3 (not released yet), c.f. 
c8d852ad63219d067e497a77d489a4011b0d0a26.

I'm sure we would welcome a patch for changing every occurrence we 
forgot to update in the docs, including this diagram.

Thanks for the report!

Looking forward to seeing the patches on the ML.

Quentin

