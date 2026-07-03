Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F92C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 10:23:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89375.1783074182902443074
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 03:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZcmZ7FLT;
 spf=pass (domain: cherry.de, ip: 52.101.70.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEBQDeUactY96J6aIHH/ZU9p4ZF2Dkr0BNUrZjgQmGLA+AJ14a+Ch73reXq4tDcKhD+20O+IVvQQ6iPu+/dpH9I9KTp7z3E3FUh0pxWFbUCtDqgjycY+QV8uLIoJVdAuXmtDGHcjz+V/pfpIZsbP3kBgL+zAhk4kdYmf0Bi+l0NoETTDbSK/R0UTdvMgmRSMJ5eiWeTmpYGAsCVwdCHN4n4hi+Ubin7H2aE5tBWLqcuXZHWNly4hlFF9ihOXxDCLXceq7EQhuHCCL9GGiKZ9sESl9GM2XeFxzO0H7+NWDVzWGJgIdLowPVyW9LtXG/nW9W0GoO1DOZ1dWC0o0mglTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7aDPTy1Ui/cn3B00jj+SKESBaAR3pvEk2uCEjZYF20=;
 b=ldr2RY8EKfW8a9rILnyb8+vhCvagb+Z63ougUXgz6gM6f/sn+WqcxaY4mCTbfiA7qFuUgeR/OXVP7J6dEEXFcmV2zPwgaAtKc3y8nvBwbe6NdvHA6qs6iV1P3cP16YLZHmvqbFfoHlo3qDL287qfrxXq+YtWbcjLP+2KsL4mjq+B0SGV2/fAsAuqpSA2N879TdGcvzYQ9GV59AclfPXZYmYP6wTlHtBTNvcHll1XcxMxJJqBROhiKEfGjyvRNxle2QDxiiwXTKNEKNh4yCMX8wyyzlsR2ay0YlOrD2dOG4xLYDDYSFrLGEGvkKUxd8XpUpqnb0gyen1kqAxL32ly/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7aDPTy1Ui/cn3B00jj+SKESBaAR3pvEk2uCEjZYF20=;
 b=ZcmZ7FLTSYX2wqtiDaS4p9QmTp0YxplyJzZEmvgqB3aA1W4YIpKsVv4Hj+z5uQbN/1SEySaNzdJxsz6VLq4rmmBB2Gmt/rRjB2pJyHWV25W613YhYj4k8ehjOAM4LuTWCkwlxotPfYXBKq+h5A/aF+abrJ/fyVIl80kr/HGKmz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI0PR04MB11671.eurprd04.prod.outlook.com (2603:10a6:800:302::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:22:45 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 10:22:45 +0000
Message-ID: <ade7e005-93df-433c-8b02-e520b0e9478b@cherry.de>
Date: Fri, 3 Jul 2026 12:22:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/3] tools/check-glossaries: fix default doc path
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
 <20260702-pre-commit-v1-2-0ebd211b5d5e@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260702-pre-commit-v1-2-0ebd211b5d5e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0016.eurprd05.prod.outlook.com
 (2603:10a6:803:1::29) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI0PR04MB11671:EE_
X-MS-Office365-Filtering-Correlation-Id: f76a05c3-ef02-4157-751e-08ded8ed05e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZQt9wBGC9RLsJXy6TSG2NOhWENrohNUkskckHbpnjapWBJ9AmcxKQDcA1g/YY977lnm+O0uqMT0cGy3BJEztpJZTJg+779Vkin9101oTkYcguN/1Z6XEn5AslDdfU6W0uaXP1OoXRFuntHB6viIkbHyL5NbIh/E8/TNso/Kfl5u6EKYLvTT06QiqwWNvzKy9+X5O64GXjLHY4kh/D0ASFx7ZdiXi4ZEW0X7mRCQ+kbiNhXZ76dGAuDX6meFLRCDri1SF4srmhQDQTAf/E6b+KT5kAiOwp40mAU3XIoppuUpFeIzLmHSDgLTTKm57v7WCkQ7zBhob6rs+J9wqqhNpzT4fruedtArFZrH3LTrde4eiqx3x615nAydG5SKJTR7n5gdwGqxll8a50v4rSfsmqMLdDs87JW0NqwHgCrpy3rpE5e0dTfSoBlM/Q8d/6737SsFpjxl9yR4DoapXiafNGMIENay6uzT6aqqWua8H9xENJdep1blsY5/oYN+BMZg6ukCor4kgee0Z5z48XH97PDzKs0zUexy7yokMDXScf1OyjcaSFM41GfC1lo24WECWJm+fV1Fe60AGkQVGTbexBVqCJzgTSQtlLrqiur4bIH4OgGL82TZ1ymh61n0X+SUyeIGIGlhQs/tdTyw9M9c0WYNlcKC9kSODjC3n99Kc2GQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVVXdHV3Z1lFSmdqNUFXQlFId3dXK01YZjFHeUpKcmRoeXYvNkxkRDVNaHM3?=
 =?utf-8?B?L3Q0NU5wTWVKNGxPcUhSLzVqYUYwMVV6UDBIWEk4cEZ1Z1NLa1JrNk5qZTJI?=
 =?utf-8?B?ek1WNGxZVzhlOW8rRGVILzBwYmVBd2R2V0NQbmRFa2p5dGhVRkVnVzNsVHdU?=
 =?utf-8?B?MDY4enJWUGg2YVdZMEJEaDFCNTdONXRnM2R6R2p6amY0VFlNbE9MV3AxeHZU?=
 =?utf-8?B?M2RDODhFVmlBcWIvYnluWWRiVVZlL1JsSHpLL3FtbGM5L1VGc3pZbFhpSmoz?=
 =?utf-8?B?bG12UDZFaFN3T0NyVXlpMTlvRFM5Q0pRUmZqRXl2WlJaRnRzb2cwVG8va1gv?=
 =?utf-8?B?ZmZNaDY5ZzI3NHBGZ3FZekdWSkZXczVnWFdxdWhjbWJ2dTl5T2UyT2MvdXhT?=
 =?utf-8?B?RU9nM0pIR3hEYjBYUitqME4yc1pVNHg3dHlmM202Nm94NW0vaE1kQTBkU0Q2?=
 =?utf-8?B?Z09SSEtEZzF2R1FLQXArVWNRbllWUElHTWFLYWd4V2s1N3l6OTY1OWh6VXlI?=
 =?utf-8?B?UnJSc2tGTWpReVRZYzY0Wjc5ZWNISUljUG9BTTVZYkgyZ2ZXbHNaYnUzSnlM?=
 =?utf-8?B?MEJQaUxkNllCVVNGaFVMYUk0WEZjU3pWUDJ6eHV1bGRCdHZ5a0JCbU5kVElD?=
 =?utf-8?B?N2dxNzkzWU8wenlMQis4VjArNzkvMkVpRWVlY3ZrTENtcFVjWTVlVG5xSEVZ?=
 =?utf-8?B?TE1jeENJWEJrNkwyR3pja25sYU13aUtjdjQ2RHV1emRTYzlqZjF6ZjBsSDYz?=
 =?utf-8?B?NVBUYy9MTGlUMERmVG51UzIwTlBSSUNTWk11SUpVMVV4R0NvVzNpSDU4c3VB?=
 =?utf-8?B?cWlFR3RxWHFob2RuOUpCbWl1MVRsdm1MS2xQUXBENjArYmZITGJEWHphWnky?=
 =?utf-8?B?RWpWVkJTTVhTdm9yc05vVHgvQ2hkZ0RPRHpsbWkrRXlWN0R1dFNIRkNNL1Vh?=
 =?utf-8?B?SlJHcXN6SkhKRVdRcStCYmhYTGJyVDkyTDljSEdxWllaOHFqLzBPN0Z0NzZI?=
 =?utf-8?B?MXBHTTYrUjZUcXJWU3dValJsNGZ5T0c5a0hkZFlaNlhxb2JlL0pFdXNqazlN?=
 =?utf-8?B?WXZHMFhDbHAxcDdkQjlMVUxHR1pDTFNpaUFHZ2N2bE9PQkJ5Q2hqSGZkd3Br?=
 =?utf-8?B?bkxjaVdmTW1neXNtc2VmbmNFZmRqTHU0SXBBQ1BaYkhLbGY0SnV5M21LbDNV?=
 =?utf-8?B?eklDZWZEaVJlUkRPQy8vYkM1M0laYXl6T2c1d0xzbHpxaW80VW9xNC9oaW5B?=
 =?utf-8?B?SUNrdGp1VkJvbHhIWG9UdVJDM0tLSUEvMklFMVZDVHRaWjFaWDlPUGJUc2t4?=
 =?utf-8?B?STlWbUU0SXBQY0hXemJmOEg1V04xTll4NWZSZGdSTUIya3V3TUNWWDdSNDZE?=
 =?utf-8?B?WFJZalZ0N1FiNU1wMTI0T0JJYm96Zm5UQ01KMDh5Y2FvVk9pV2pYaXlvVGw5?=
 =?utf-8?B?MWtzVWhvYzVrTC9JcW9VemQ0M0R6ZUZ5QlltcEFvcDJid2FUSlU4Mld5VFFw?=
 =?utf-8?B?cWhicThSZ09EYVBmUkZpMzZtRC9xeU1MK0ZmbzlhcGpvSTlvS3RCa3lobmtq?=
 =?utf-8?B?OG1GODlqZXVMRFRxdzNJZFVkeUtITzh2a2U2c2orNFpZT1BpNERhbzR0UkZW?=
 =?utf-8?B?RzQ3R0g4STZkN3RKV1lYZWxWQ0RNeDYxS1dtSDE1NDBJSVhsVXlLcHpNOTBP?=
 =?utf-8?B?SWpLMExFaG5lN1J6R3pwd3F5WlRHZEJmd2d1UlNTQ2VZTUVXaGxVdmFMZVNR?=
 =?utf-8?B?REdCdm1jWVVqQzFSSVRSaFkzNklzeVRJRUxzeUw1NXdrZUNRVU5nRm9zZWdw?=
 =?utf-8?B?TDdUWFJUUXZ2OXVZK2ZVcTcrOVREM0NFY0pIdzBmTVM5ZnlLRnZvQUNJVktt?=
 =?utf-8?B?YjcrTFpZRVVDN1l4aWg4Qk1na3YwQWdZRVpmS3I4M0R5OHRnazJ3OFZ5U3ZY?=
 =?utf-8?B?VmZrcWhseWtBRkFRZjVXZUxzRUVCQTRoLzh5SXZWZG9EMHlZcUZESjRxZlBr?=
 =?utf-8?B?azU2YkllK0NoRyt0Y2lxMGFud3o1ZVdxakdlbmFoM01vK1kzRTVGVnN6Z3dU?=
 =?utf-8?B?NzVDVnFXbk44ZFdBWUY0WUhueTZLejNvVGpPWjc0SWo4Z3gyVG5DY1ZPcWZL?=
 =?utf-8?B?UENGU0pEclp4U1NZM2JadWg5YkMwYXZ4c1RFWENjL01SUnNPQjhuR2Fibk1Z?=
 =?utf-8?B?UXlEZHp5NWlQN1dGYThYVlROcTNlYVU1aEx3bk9jdE5XVmxHNmpBUmlTNklD?=
 =?utf-8?B?cVAyLytQQUhEYTNNa1N0KytzaEdKRGlmdlF6Tmdlaml3eHp5VVdMT1ZuUGZO?=
 =?utf-8?B?aXMzajRLYzBScHlOb21ZQXRrUFlaTkt3UG9kODg0ZGo0MGI0dHduQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f76a05c3-ef02-4157-751e-08ded8ed05e6
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:22:45.2774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyeG21+qvVUKkL2d5PX1rL+qHUdHew3T6/6GIYRjf9pT18wDtT/QwHd9afIj+h5DN7/nSZii29Hvj/1HzgiJaGJWL0pSprBfaIm3ErwvWAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11671
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 10:23:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10011

Hi Antonin,

On 7/2/26 3:59 PM, Antonin Godard via lists.yoctoproject.org wrote:
> This default path pointing to the documentation was wrong, fix it.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/check-glossaries | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/tools/check-glossaries b/documentation/tools/check-glossaries
> index 9f1a47126..6bfddcfda 100755
> --- a/documentation/tools/check-glossaries
> +++ b/documentation/tools/check-glossaries
> @@ -14,7 +14,7 @@ def parse_arguments() -> argparse.Namespace:
>   
>       parser.add_argument("-d", "--docs-dir",
>                           type=Path,
> -                        default=Path(os.path.dirname(os.path.realpath(__file__))) / "documentation",
> +                        default=Path(os.path.dirname(os.path.realpath(__file__))) / "../",

Path(__file__).resolve().parent.parent

is much more readable IMO (and also, we avoid the mental gymnastic of 
seeing ../ and having to remove the last directory in the path.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

