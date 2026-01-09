Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFC6D26D7A
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 17:07:21 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14801.1767978433714725375
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 09:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AQ9RfbdD;
 spf=pass (domain: cherry.de, ip: 52.101.65.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmB5Dqam4iYZ21nO4C4pBkw9E0kZkWIESdj++j3sFqDy7oncloqIx+e4vGemWtOq5duYdrySRBGWJH2dyRe9cJNYdkjP6JJlGYAL+PNQsnuaqApluBxcYDS3BY7xYR7DvwKX7Ps+s3RtfUCa15E+RwmXOhR+XwdZaiNG4l+NmD2jojjM4skvc8S2bltQePjr4crgmSNc7YPcMo2EjMeYCCNon4jJdqnhDWzHKjj/Yiu41XlGenkFbRgVmr1xxY4MOI9f7xuDpcxHUbJby62pVRqAg8KCzSwyNjK+g04sSIYDAyU3rC8sXDQrLTzeOrabMRmlRHyLXFUNbH3sRZuqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6jpU5qOygQjtLfCSJCQ+rIqOFbvd4XEY5hCC9sKe9o=;
 b=vyJf3Sc1QVfp05jhjUaVT48K4NHO1yy5WxEsv2wG3A3g5wTxPxHwiEUXHvm48fYTx4Qtc1t+yOxhUY8Nci4oBaEvuo8yROufpyRl0+MVKpug9Aao9AHAufRtvYeloE5VLFGkQFRUMBK/TwGunUawi6TQ/Uj/RXZ85UtBeFPIeQe0PxslMUzoBN141564mwkDh84ivWFKGejPTvmtjPFO4vQrJ2q3MqZNzPnemtvM4LbJejVAfU8OvUo4GN7pkGMuifSEYh4+eud6j8Fkm0X2nAiiVyRkGXsY39BmzqyJPt+avEypk5MFSni3XcTcX4wNQyIKMjzFcAHFpJQaXr8QUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6jpU5qOygQjtLfCSJCQ+rIqOFbvd4XEY5hCC9sKe9o=;
 b=AQ9RfbdDQMEKrJDwAuom5T9EyA6I9ZUiwyZB1YntyuAWOhW+eQ4zMefLIrQDPXzeVZG1sxV4ahHZArFhxx6FQFqEeqk6KUgB7U8StkC0MFggkO4hdK93x6k/kczVW9qjaMEA6hzJB1Qr+i0dYPkdlO3hRGmAGz0YlM/6aVsVYvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB12125.eurprd04.prod.outlook.com (2603:10a6:150:316::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 17:07:07 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 17:07:06 +0000
Message-ID: <87976365-b9a3-4c4e-83fd-2f0163d43106@cherry.de>
Date: Fri, 9 Jan 2026 18:06:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Parallel docs build improvements
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB12125:EE_
X-MS-Office365-Filtering-Correlation-Id: efcffddc-4ceb-48a8-2eec-08de4fa18495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3JibTE1Yi9XcytnUmVNZEVFRVRsb0RBZHRiT2p5L2VqR3h2SWpZMTE3Rm0x?=
 =?utf-8?B?SFE4dU80dzVQVCsrcWJkK3o3MVZ2cmdITjlrVWZKQ3BxZ1BaTW1VRUtnVkNv?=
 =?utf-8?B?SGtjbHo0NDY5d2x3NFZYN0Jja1N2bDdLWGVlYS84VlBoRUtCYkh2d3ZFckg1?=
 =?utf-8?B?cXg3OXRNdEJBN09jdHo3WkRTSHNlRGwvT1ZWNEE0MHJJcFY0MzlyS0lPZlBV?=
 =?utf-8?B?T0k2b3NVTnJFU2poWktEUnVEL251ZGhXZmJtdmNIaWdHazZqSzJHYXAxTkJj?=
 =?utf-8?B?aVZDUFc1VThKTmd0T1VxWlJUSzZIbUZzaXFHejFoOGJMREZ3amdMaTl4OWxQ?=
 =?utf-8?B?WlpHcUtIdlBuc21URGt1WnFxYTRFL1BocE0vdzRMdFJEQTF6UzhLU25RbzV1?=
 =?utf-8?B?V0ZxaTFTYlA4Rit4alhycGs0Rk11VUk4Q1lkY3ZMNnFBWkdSSWRlL05WTlhM?=
 =?utf-8?B?REhLVFNBWm1uUy82cFdHR0FORmxqdFFIcEJGUjJaaFhaS1lLeXp0NGFEOE91?=
 =?utf-8?B?VnNOM1V4ZHEzUHdoRHpQUFJwTWZTaEhkWHJrRVVjTWtYcG1iWGJOMUdlOCt6?=
 =?utf-8?B?QjVaTUtiNVVWdGpRbEsvaW1kN1d0eDJQdWtSRDNGd2FnRk8vSC9zL1dLSmlt?=
 =?utf-8?B?elIzVHBVVGpPV0dqZjR5Q2NEOC9uQXo3WSsxZlh0bk54ZytwYTNVeHJoRnBM?=
 =?utf-8?B?UUxqYlNPOFdpbnNOQTduMUVjSXhVRC9YVFpIWEFJSEJWSVJBYlcvZmRuMzdZ?=
 =?utf-8?B?c2ZKUkhBY2Y5b21IRmwxNm1GTWh6THZnam1LblJPUDNQTHlHdjZESTFLZlhj?=
 =?utf-8?B?Z1RUTDYrSUd5SG13RStQSHE2dFBTbzVSZkVwcytTQnZtZngxQk41U3p4OURk?=
 =?utf-8?B?Q0IrNm52VnJEd3crUWkzM3daV1VBRlBOekcvQlA2MGxyM2pxanVCTFJvT1Zm?=
 =?utf-8?B?Mzg2aVplWTliWlZyM09rdFppeWRhS0Q1R2NxTEFzWHY2TmRRbGkyeTZaRFpM?=
 =?utf-8?B?ZUtBdXpmY1Baek02R2dHUkl1Q3hnM3pFWHZHelJRRTJPejlYRUV4SkVvMXl0?=
 =?utf-8?B?eU5NQXZnRXpKQTExSnB5YzBodmNoZHc4eFhKK3pTajE1UjFsL1M2N3NmM0x4?=
 =?utf-8?B?VVd0ajVNTk8wVDFxSGVGNHRHak80SVJkek1nRHdCekxPNFU1UmlISlh3blZw?=
 =?utf-8?B?SzNoT2xGWlUvZVAxVWZBY2o1Snc3bUo3R0EzUjhWcHB5UlRtUE5sOGJVWXQv?=
 =?utf-8?B?ZkNoQncvL282ZGJTWE5QTW13MmY5SmU2b3hFSGQ3L2hkNmM2Q0JjaXBaQ0Jr?=
 =?utf-8?B?ZXB0Y1YwZzJRN2pjL0EvdlBmc2RrYTVQQTA5M1B6Z0ZRYVY5WnBkbWpXZjdk?=
 =?utf-8?B?NUx5dllJekpaN0xSRExFNnIraThJU2NPYjcwaGdNbzk4RFl3Nnc0bHJEN0ZR?=
 =?utf-8?B?cTdPZWdKNVRhNUJEa2lVZjBhMzJNZTkrM2hyVFJoSlBnam9DY3FqOG5udUl5?=
 =?utf-8?B?QXRoOEVvVVZOU2s2K25weWNmbU9IWTF5aHhJbDBmOGthK0FYa3EraDIwMmRl?=
 =?utf-8?B?aEN4WDE2R012YjJUNy9na2MrdXNyK0hnZGZoVE5DQ0FnOGxTbi93bjBCc245?=
 =?utf-8?B?bjJGY0xPV1gwdnNOVjhNV1RraGdtb1RGYjIzTjdNeVFkZXFpdXJYbklSS1Ba?=
 =?utf-8?B?UWhacktPUjdCYjNXK2NGNnM0SnhNenBaRXMxajdPL2V0M0lQUC84bGxpS3RD?=
 =?utf-8?B?a2Rzbk9xdWhmbHhRTk9WTXBBKzhyVzRodWt4VWNrUCsxTFFObDR1RndqOXE0?=
 =?utf-8?B?dVpNb1ZkdFViN0V5djlZaFp2b2QwTFo2MHluckZ3Uy9UK0tHN0JTT0tQRXJP?=
 =?utf-8?B?N0hQcFR0bzVHenQ4ZThRRzFIM0ZpdHgvSExWZ0Q2REV1UTBnYk5IMHN5L2FK?=
 =?utf-8?Q?Rq355MPedFN3/LBOnsDT//kRvykJ5SIB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qkh1TlBqUmhhM2VWSjBRUDA2cS9aMWlPL2lOaVBBOWQ3M21XWk80d1p0cW5o?=
 =?utf-8?B?QmpHbitEYTZCY0tIYk13d0Z4RU5Oby9aV2YzdzBsbVpXY25zN3hDaTgxQll0?=
 =?utf-8?B?eWo5cU50NWdVQmhpZ3N0blJTWEowVVJnSXNLa3V6MTV5WTBYdkRqa3N6NVJh?=
 =?utf-8?B?aGdZcVBnallYaEhleUNXUUFUaVhwZDlsbGRrRFVGMjVSeGxXT2c4aG5kSnRZ?=
 =?utf-8?B?WUxlYTZzYVlzckIyVTZHS1RGbzFYdzIyblpudlhkS2JHTjhsVnJmQ3RTdWZp?=
 =?utf-8?B?TmpDUWJIV0xyOFB3MjRkTjd5YkNhUW01VzVJT0JKeDdDN3g3Z25QUnkvUzU0?=
 =?utf-8?B?ZUF6bVJZSTRFQ2hoaVM3SlJ1WDd4K08yR0RpdlBOWDM3TytMOWlUY3pQa1V1?=
 =?utf-8?B?QVJ1akt2UWF6MFJHYmxic2hKajhlSjU4VnVnYnF6cGIwN1oxSTAyVTRSR1lP?=
 =?utf-8?B?dUliU0tqUVhCYW05MnMxUGhZYkJhTmxyTzF2dXZlWEh3NXlJRlVkNFZ5SWtO?=
 =?utf-8?B?WjRrNzFRRVQzTTJCU0NMSjdDbkR6WGJZb0RDZ0hsRXpzOEhHUTE4bGVUMGJn?=
 =?utf-8?B?b3F1RFRDeDQ0TTZpU2srMVR3cGw3cHA3Q2R0TFNDL2xaVkh2Sy94OHBiVVky?=
 =?utf-8?B?WFl4SXE5NDJDcnk5bkMyRzNCa3FRdktha0NXaEhFbHpjajFlMURtRzJZekdR?=
 =?utf-8?B?SWZ3Wjgzdkh1ZFV4c0p4U2doY1Z0dUpsOUNRN2lwY2JpTlA4bUMzK2dZdGFN?=
 =?utf-8?B?Q01GZ09OdXU1RkNpc0NaUC94aGFKdW5iTitDekV3RWxZM1Z6MUtUS1oweTIw?=
 =?utf-8?B?RnRYUkg5S2lhUldKV1o4TjEvcWJQZmt0MG16TjUxM0pacTZ1YUtHVWtJMG41?=
 =?utf-8?B?d3Y0ZXV4SGt4M29Qc3d4dzVrNUl6S2hhM3o5NU9lTC9ldjFkVDlmR0prOWVD?=
 =?utf-8?B?YXZGbVFFN2dmeWFLdlAyaHRtVWVLQXBkU1dQSkVPVzZtUWtlNUwyUnZYVzZZ?=
 =?utf-8?B?NmcxbjVqQ24zSnZuRi83eVFzQlc0Vjg5aElnTDEyQ0djYVJ2dUNNZktTUmFq?=
 =?utf-8?B?NVJTN2Q4SW5UMTdKei9MUW9wREE5LytpN014dUJIYlpaWU5qcUQ5WU9zenUx?=
 =?utf-8?B?ekJNQUpZZ3VtaitCZnVkU3IveGJ0dVh2UHFQaUl6RkRGMjg0a2p1UGxNVlJ6?=
 =?utf-8?B?Zjg0TXE4TXhRVER2N3VHNUJXL3o2eGRRT3F2dFJPZjU4azlBZTk5SHBDeURu?=
 =?utf-8?B?R3NzL05CK3RBVGFHWTBUQUxCdStiS015b3hEWmVkZXZzeEw3NDMzVjNTSnZ5?=
 =?utf-8?B?R200UlBCVmdmMWVjVG8zU2RTWXFjRzVockZOclRHK2dWc3NMbG1ha1dmRE9L?=
 =?utf-8?B?RkR6MFNnYjl6RTI1L24zK3hmOWU5S21vVnRmSVg5U0ZhbDJ0RldoVlI1V1lR?=
 =?utf-8?B?N0hldkdCYkVMWWNQcDFTMkFiTENGbklBRFFhTHhoeWtIdTBIbXpqR1llTFE4?=
 =?utf-8?B?aTVUV0Y1TWlaMC84WWZXd040ejJ2ZHpKNHUxKzFQUzNhN0NmVnhCRVNBMnZq?=
 =?utf-8?B?UEUraDhkSGVxa09GRUJzUkhTN0JUckhsOEZFMmdQblFVYkdBMTZxNytQTExW?=
 =?utf-8?B?UGNHbjd6TjA0dWxpMElzc1lCQVYrVkpKcHlSVFlFVVlOdHM4akNTS3M1T0FU?=
 =?utf-8?B?ZGk1cVpzQlUvWXVLcWxTSXFlb09SaGxUcTRtNndmZWFMSmIrVDVrNHMwcGJ4?=
 =?utf-8?B?Ty9UN3RheDNGcHlkR0tJRGVwODc2ZFNlOW0raWQwQXptb2lKR2hibW5lRGlL?=
 =?utf-8?B?YTN2TXFYRDVPdWt6MnR5QVpQMXdrMGd3OEh0b1lZc1JnaUFLOEpVdEZJSjVC?=
 =?utf-8?B?N0ZzdktiYk10ZCtZS1J2RzkzRXd5Y3p5NCtRNjUrSXFzSTNhVkgxVE1VOXdY?=
 =?utf-8?B?UGdDbTNHUW8xa214VlZtRE5hTFNuc2ZvODhMK1FPTTBEM1Vsdy83M1I4NHZp?=
 =?utf-8?B?bGtKZXI2L3JrdmtORmVkb0dhMVcza3Nma2UyUVNtUlJSRXRIMi85STN0NmtN?=
 =?utf-8?B?TW16NTFmS3ArdEF4eDl4RFVpTGpscUpra21GeEo5VFl2cEJRZ0RwcjZxOXlE?=
 =?utf-8?B?ZzZnRnA0a3Z1SjlKY0JSaVZxS0tQTi9QalFpLzJBZVFWYURmT2FIR1ZpdzAr?=
 =?utf-8?B?ZzVka0JYRDhFTVE2bmVaVXZqSlczaVVpTkFkVWlFL2hKZGp2dkg1aTJzbG9o?=
 =?utf-8?B?eDcrNExTZlBBZ0tJRnExbGt2eFBYVTNYaTJBNlViWEZWanY2LzUrMXk2NFhU?=
 =?utf-8?B?S1ZwRk02NE5zRVdKQkVQM1VXSFByTXZiWWVQN00wL2VhQXZxWUc4Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: efcffddc-4ceb-48a8-2eec-08de4fa18495
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:07:06.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ky0wHpdUKTCQ7h4NktXPm5ufsRDL2i1gDg7zXe/mY66iZfmdCxhtHAHAGqAl1XklUJv6bmi0ROXCaMsmahaegKT3ULuH1XrTKH8Ek3xA9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12125
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 17:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8451

Hi Antonin,

On 12/22/25 1:27 PM, Antonin Godard wrote:
> The aim of this series is to take the work of Quentin[1] and with
> additional commit that improve the concurrent safety of the docs build,
> and some general improvements to the build-docs-container script.
> 
> This allows building the docs on all supported distros with this bash
> snippet:
> 
> ```
> declare -a distros=( $(./documentation/tools/build-docs-container supported_distros) )
> 
> for distro in "${distros[@]}"; do
>    ./documentation/tools/build-docs-container $distro "$target" >/tmp/docs-build-"$distro".log 2>&1 &
> done
> 
> wait
> ```
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Antonin Godard (6):
>        tools/build-docs-container: build in separate directory for each distro
>        tools/build-docs-container: create symlink to latest build output
>        Makefile: wrap set_versions.py with flock
>        tools/build-docs-container: allow running non-interactively
>        tools/build-docs-container: allow passing extra args to $OCI run
>        tools/build-docs-container: make it possible to print the distro list
> 
> Quentin Schulz (2):
>        tools/build-docs-container: guarantee the image to run matches the just-built image
>        Makefile: allow to specify build directory
> 

Those are not following (kernel) contribution requirements.

See 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Anyone who *sends* a patch need to add their SoB (at the end of the list 
of SoBs, Rbs, etc...) even if they are not the author (who needs to be 
the "first" SoB; see exceptions in the Co-developed-by: section 
underneath the section I linked just above (I don't understand the 
exceptions but I rarely have to add Co-developed-by so it's not been an 
issue for me so far)).

We don't document this in 
https://docs.yoctoproject.org/contributor-guide/submit-changes.html 
(possibly because people rarely take over patches in Yocto?).

Cheers,
Quentin

