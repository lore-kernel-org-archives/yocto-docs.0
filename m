Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B071D3F07B
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 15:04:43 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15431.1769612673681407948
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 07:04:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nkwUpA7o;
 spf=pass (domain: cherry.de, ip: 40.107.130.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WH8yGvKSmcBqMNtzWPj+6BF3mbj/rGfGmtUhuv+BzDkmmW7gkZzeKuyphrYhqvqdSl4olNimkKrvEV9huxXplPNgvpAxtBnGE6ch2f5vdgoqr7DVWFBHosKpuWQ8jAX7/2IFfgDxn4JtFe60n1jQleS8aFyikWzRwUsbgKHBBXaKDEAJ8pm8psdibouSM/O/OsHBpXgSQaWdk7YGYel8Rn7B1jguqAtWgHB8dpdlpitcL9us5E7LHCExZDSMjL9ZXvPKpc6A6JSmdAyZIoPsFSyw1dCeYQlZVrmuIZ40lNh/EF2/fTgsfnj1h+LtYd4OIzmXq9VrdZ4s1izla2wAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=oKdIubYci6eAyhnMMo5545zfHlPBpgT91Qkn5viMwpvWCVHvSHkEoD36YjRIbSxTZ9ECwEBsdd3HoPsueDWkS7Eg8RN1JGXY9GSboSS4wr7eafa60YiciYcnrv12HhKT9NC1Ncx6xCCtYJy6nzXHl81aPePLdCZscBlDmK/awJF+KAAt4rvbvH72R6zyJHJ9N8bm6kJsX17pHGvp8MxSVpVWPRVfV9eH5IzYs+l8Cr1zv+q6jgnI/egDIGniweJ4LkiOxWOQxfIbJtrTN9hK9E/OSdJv/spi/JFIxeEYsgFWLaqDjC7o8epJYR54rk5KtshBTr0XSbyiKp9oCwcMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=nkwUpA7opt3KTyW+hw8P2oqEkNnOYajvm47XVmDnKsafvexa707EMUQpr4TYUvaN8VHw2AcwUA5NX8lYylAJY75QMSAxMaR4w+ZMsthtvVCfhcvZ3QNbkQHJ6rEQL5KeoTN1RhfJQKko6uEUJD7+Oq5fx1ipHRt2Be+MBtPE22w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8781.eurprd04.prod.outlook.com (2603:10a6:102:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 15:04:30 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 15:04:30 +0000
Message-ID: <8f451222-ceb6-4c60-aca4-a1a9f61695b1@cherry.de>
Date: Wed, 28 Jan 2026 16:03:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 55/56] test-manual/understand-autobuilder.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-55-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-55-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: b009d84e-ec09-47e2-2ec0-08de5e7e8981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmMrTk5xeURDMFk4VUhtT1o1QzlyQU0yS2Q0TTRHdUcwdzdqN1kyUkV3SEto?=
 =?utf-8?B?TU1zSHZNeTd4eWNyYmw3R09MNmFQbG80ZFdwWld2TWVaRnAwYWY4VUFOY053?=
 =?utf-8?B?L3E3Q0FMSHZFZk5weFVxYklrRjJMWmNnQ2xpQnZwdkR1YVlQUDFMUE0yYkxG?=
 =?utf-8?B?S0RzQ1YyWVVlK3ZhdWVrV2dLZFQ1eWFMVkVVc1ZsSlBTbDFtcVNOU3A4bUY2?=
 =?utf-8?B?Mk5GcE1rcHo5eFV5eHNXajhvNmZDeVd3NXl2L2N5MjY4U1NoUFhGS0dYWkxB?=
 =?utf-8?B?OFhxbThlRkZuSzcwMTQzS1l5VnZBc2pWc0dlb29sNUdaQVY0alMzY0xlc2dW?=
 =?utf-8?B?RUR6bGhXUWVsMFBQRzByMzU1K1JCK3dkVTM0TzFmSGFQaWdPZGZCL3J4elpP?=
 =?utf-8?B?WkcwS3VGTEozaDkvS2RhakRockxRdHM0STVkT0VTQlEwd2NtSENYdGVoeVFi?=
 =?utf-8?B?Vlp6dktudis3K3VLeGxab3NsS204b0hSdU00ZVhDQmQra0JGRGFReWhERjYy?=
 =?utf-8?B?T2psWlROV2t1OW9JZElRYWdDRCtNMG50K28vTjdiUkN4ZEU0UmZ1eko3Qldt?=
 =?utf-8?B?UDFndTV6akMydDFhVzBLQ3R3R2Z0SC93eGd6ZXY3czI5a21mU1phYlhvZVNV?=
 =?utf-8?B?bG5ITk8welRXNG1COVMyV1hIdDUvN09IMWRaZ2ZoL1pvbG5lMjBBRHNLZDlo?=
 =?utf-8?B?eHMvbS9yODMrKzZSTW9JbGJXRXJNblZMN2ZybG95NjVaSURCelFMYnBDUjRJ?=
 =?utf-8?B?aGROWDVtOEw0QVpTNjVtNXYvZEhlUmlwc0lDbWttZkVwMDFZSHNoQTh6SWxX?=
 =?utf-8?B?S1crWlVzY1E4Nk41Sm41VHZzZTNVL3FmQTFCWXRHcnFjNktzZENPT1BQaW9H?=
 =?utf-8?B?UGNlM0FKbTRVeHpwV1JTYmtHd2VxZnoyRFdLSFlSclFtVWZ6bkZxT3ZhLzNG?=
 =?utf-8?B?ck5YbTRZZFR1SHdjZXowb0hkU1FTQngvMDB2dmdnQ05vQ0Fyeis4MXRWM1RI?=
 =?utf-8?B?eTdsYmFmcUZGTGNzK1dCNDU0OUV4aUVObnFPUTF3MWhTeGNHS3VDR2R3a0c2?=
 =?utf-8?B?UVpvaGdsekhhM2I0aG5VdWxDSXpaL0x2c1o1MlBtZ3FlRko1eXlXUlZYYUlR?=
 =?utf-8?B?ZjJ6MEFxSTFFeVZ4RVJrcWpmaFBMRG41SFRBK09TOWw2V3Fkb1g5VGZ1Y25C?=
 =?utf-8?B?djZiTFlSQXBwd3ZYT1psVzUvd0VLMTdwZWJlYlBzUmhiOFpzcWYrZWcwZ0Yz?=
 =?utf-8?B?SGwzejR0a1hMNG5iUytnMGxlZ0ZyMERpRTlBNHJyeGpXQVh5TWhLeVBzajRw?=
 =?utf-8?B?eWRiRCtUd2VZZXZtRTJDOVhoTlFUcXQyNkNlQk5FdFY4REpzL21EUUxCcjU2?=
 =?utf-8?B?MjBNMERIU28zSStqVHQ3ZEJISnBwMDg2YmRiZE1nYm55U1JMaWFRV0RaRllx?=
 =?utf-8?B?eWlNNlVLVjdLcC9hT0lzeVUvc01iUUk4TWNIT3pwTnVZZ1RVS3VRWm5IeXdO?=
 =?utf-8?B?Q0VpcEQ4K2pvT3cxQkFqRk5od3A2OXhsZzF1aWhOZndKaU9ETWhNTXY4eE9n?=
 =?utf-8?B?YlAvd1plSXhscERMbmFhejVYL0dxUDZ6NTlLYWZmSXlsWkNybHd0Ry96T1lE?=
 =?utf-8?B?Y3dXc3BwVEUyS0cxcUcrUk9zRlBid1RWRjF2eEN1M3Z2ZWI2OUwvS1NMdzY1?=
 =?utf-8?B?NXBtS1grNnlzenlwVkdpeUhYWko1MXR6dURpTmdoQUxPM1p4MUczZVp2V0FH?=
 =?utf-8?B?akhVbXh3WVJQaDRuUFRPY0ovUyt6ZkY4MVkxV1EzR3NQS1FnVkZyL0RPaXR0?=
 =?utf-8?B?OUgzSEV2V1FxTmlabmkrME4zRlkrL3VFcm1FZjFWU1UwN3lkNkFHV3hQK0w1?=
 =?utf-8?B?SnN5UTZiM1JrZUZaQkZ4bVZrNHdXMnJDV095dVRxNlVRc0FLZmJTeENRSSt5?=
 =?utf-8?B?dlVTeUJMNWFQem5STUZGYnludW93QWpsSlF5Um9XUG93dXJ6aG52UUFjalF5?=
 =?utf-8?B?UDc4MW5RdTQvYWtwU0ZKZ2c0aVhOdE5TdFZVQ3hOVjJwdklyT29YT1JBT1NT?=
 =?utf-8?B?YWZCSEhtZFlJMGlJODQrbTdDMW94VnJPMW5XMlU5ektlVmd3dTl4SWxpYm9h?=
 =?utf-8?Q?8wwo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1BZTHlURHNaUGZNb2JJVjBtM04zbnNKcVJwUlR3K3hVdU05WjhSUVZ1Vmp6?=
 =?utf-8?B?L3Y0cktOcHJuSytqMmU4aTFMR0JSK3RyV1V2aWphUTZCNEx5eHAzS0Z1alVQ?=
 =?utf-8?B?UzFjRnYvamRDcTZTZWkxNEdQcWt1ejJFRjl3K0pqZXpyMUZBd2JwWFRhcTZo?=
 =?utf-8?B?UGRabmw0dS9pbGRZM3h6TXBFQklpYlJwcVFGSkxzY3RWSGZmTGZRdmpMOGJz?=
 =?utf-8?B?dlFyVjZiUDJ3T2xFZnlVSmRQSHdCK0VnTXNxRW5rQ21jSFFmRWxBZGpDRTJO?=
 =?utf-8?B?eGh6aTFwYkVUTXFFb2pEN2Q3ZVAvRVRDaDFYZWhsSEVNOTBEQVpmRHZPazln?=
 =?utf-8?B?WExzQ0hlcnI0SVJhYkkzeTNPMUhIVGsyY0hIbkZydytwN21LdEdqWHVwUFVJ?=
 =?utf-8?B?SkVxc2N4YzNHdnVLTzhWYzB2bHNiYjdkUDBvVlArZ2EyNytkeUJDczdZMzRS?=
 =?utf-8?B?N1R1cjl5aEtrYmZwTWtvbVBpajFnY1RNVzF3Rk5IaXg2MUJsRzJLeHlieEZW?=
 =?utf-8?B?TDA3azlLUmJOOCtEUGRqWTFTTCtUd1laamozT1dQbVNrNG81aE9RdEtmRmIx?=
 =?utf-8?B?dXUvK01FK2NJMVhEOE1WNkZ6bFh1UGtaRzk0NEdHbmV4M1dNTkNyc3hveHQx?=
 =?utf-8?B?QWwzZVNlanUxeTlqZEhBcUZFOHBwbStSR1kvRDF6aElUU0ZOajhDODRmenBl?=
 =?utf-8?B?NXo2eitlUCtmcXgzYmNDT1BBZFl4RGZrVFB6NitFTUgwQmoxL1piUzN3N01J?=
 =?utf-8?B?YWVTeGErNUdyU1VVMWl0aFYvdVYvb0V4cDVybjBjMTVBYi9SWlN2RFA2c3Yw?=
 =?utf-8?B?MHBVOUpNWWRXZE1SM3JMRjRoM2FpdHFsTy8xMzdMc1pRUXIyTjhaVlgwME5r?=
 =?utf-8?B?c0hXVWVRWHNpd2JkblJZQkNxUlBZK3NsRDZSelZaeTJiNmZkT09rK2tER3Nj?=
 =?utf-8?B?aEhPdUwveHlEcEtZcWNYc21FQU9MdXFaTVRtMnZDSEZoSkZ2Q1ZaNk9mZ2pP?=
 =?utf-8?B?ckRSK1J3TmQ2Q0pXRVA5ZkZqbGFHc05KSTNTTzRGcDcxY0tpV3hTcldzdzZP?=
 =?utf-8?B?R0l6T0NmVTlUZFJpZ1g2bTIxbUl0SkRLcXd6N0dydkFVZFE2dnVUa3UvZmh3?=
 =?utf-8?B?ZzZXYjZ2aGVZUlJmbEE3L1dVbHEzcWxYcHBHL0NrYWlOMnVzYVpTM1F4c2pv?=
 =?utf-8?B?dHRVQ2hmQmx2UTJTTlA0Vy94UjErdXZNZHo2TGJlNk1IZVRTNGNOZHdtMjlF?=
 =?utf-8?B?MVFzcjRMVHVxZjJOR1ZZS3VKbGJKN3Z4WkQ3RW5MOTlsZ09iZElWQThDODls?=
 =?utf-8?B?K2xkVnUrb2dHSStpWlFXaU5leldJcFhsK2xpZUFFQWl6T1Bia0VRS1VCMnFJ?=
 =?utf-8?B?MS9kZVFRblIzTkZFL0lVaGs3dWYzNC9uRHVLTWdZL0xuUWo4bXlVazNFYzZ3?=
 =?utf-8?B?UnlIaCtpQWcvdTdHYkZDWjh6MXpxa0RIOFdMcUR1eFd5cUFySm9Fa0JZTU9T?=
 =?utf-8?B?S21La2dDWk8xUWE3NitVM1hDdHIyOGdWeFFncUVLU2FkdlZ4MDJ1OXc1Qy84?=
 =?utf-8?B?dXJxM0NkWW5VQlZLMGNWUDd6UE5nTjRhSjR1bGtzUkZNY1lZekFZYkUyRDhY?=
 =?utf-8?B?WCsrbTk0c0JicmhjajJVYjhLc1EzQ3JBbUR2RG1CWlBlaEFGNlkzOXNGSVJi?=
 =?utf-8?B?RUY1V1pndU9reGp1bkdGRnBkZFBoTVRrWFRrdHRybUdqNTdxRXhrUjFINFIw?=
 =?utf-8?B?UzZjbm9wRG5iV0wrdGFXV3JDNzdkYzJkTWZSeEZSbUd5azk5ajQ2Ky95cmxU?=
 =?utf-8?B?cFQyL0pIVVNQN2xCOVRsSU0vWlRJTDFwUkJwdFVMMWFIUGxlWHFUK0Z5SWhW?=
 =?utf-8?B?V2dzb2dNcEhFb3VjTVVqWmdPeHY1UXNNN3EreTFGS2pjbUFpTnNNM0pBYjlm?=
 =?utf-8?B?RVRNWnhDL1BaMWxFeStXaTNkdlRHRjFtdDBsVkZnUFdDNzd6QVdrQnZiSk4r?=
 =?utf-8?B?eXZOYjhzTTFISlZXckY3WmxoNWxuTzcvdURxdXhvOXNNWGkrOXJCR29lVDBp?=
 =?utf-8?B?b1lLOG1Ma2RHa0lnVFJsZ2JQS1ptVXQ2alhKenZwTG1JbUhvdkN2dkh6L2VP?=
 =?utf-8?B?LzZPdmMvQUU3bDFTMUJEb1R1N0EzTm5SaTR0a2xNc0FwaEZZT1RQVVY4NmVt?=
 =?utf-8?B?WUM0YnhETTV1RnBTMENDSmxKNGs3WTd4ejBVSGVwWVNGZHBtK0daODR3OXRj?=
 =?utf-8?B?MTJHbGRCa3k2c3VyK2ZjSjN0bVNoZEVWMFZUVXBwSGtMUVZEekd5UlRwaWxF?=
 =?utf-8?B?aXRtamxGcFlDcGdnZWFyQXZrOFZYZ0NRZXk5dDhVSUFGTEVUU3ZYUUZBWTMz?=
 =?utf-8?Q?AzYEFa74vG3w6H61ZrHUsqyHKddeIhoKn1/Gs?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b009d84e-ec09-47e2-2ec0-08de5e7e8981
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:04:30.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lfq4EiTwCyGBNoVp3IbVQhGuWjQN3QaBs000kr1bmf6p1czCshkr7M+um2JIG+aJ+zkcPug6fXN7gCkmkpXP8DfdB+C1VxiK3NGBCwmvraU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8781
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 15:04:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8776

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

