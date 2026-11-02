Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15224.1793633720294460852
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 07:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=khxXIuZC;
 spf=pass (domain: cherry.de, ip: 40.107.159.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNHNON4i2XumzdIWxU9XrQXKkf4NePCOZfobjQXtdyWe/49hCPWlxDX97zQZAyZurVD11tJBATIiNaL4xKVR04v3r4tve9frfUFsAWo2F81FeT4Aq959gsONV4RJQ8fUMGm7SaFSNYcMmwa9FrTAx1EonXl4CraCP4nUaqK8L0wBd5e1mz/lR7HmTXvvwQSTnWbjDvy+VUvp2dM8gkwkAm7WoBFndDpO5bjpgb6L6Bpd2xhQnI0X1ElVw2hvjWFI+6Lywf6Vk2XLcKCbQZFu2B3ZDi9vzdjvJ77ESIcHzmnZyiZu5dJb5Lg4XXBdG717y6rabjpf9+V9P4UWkoMZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbtLoEbGtLhERU9BLTHlxrkb3Mi4oouOO16p1uT7Ugc=;
 b=SSMJ1w8Llsv9Q7IxM5U41ZJgLIbPiYDKGlYgz8RsfgiRIIdkWIkamRHixgpAq83+T2E0uZHw6kQhHmdnDnfg4ksQsiEq97UuHMaNi5odUD9lxmmhyPeXQoepTH2UGjxcKlEVaIqybla7VoDro8e8EpLiis/NMGwAL5qsYd7X41EAjlYOpvS7LiBFGGCSf0QQbrvibedQjVi8+AO81AmEKR9Ou16wDqC3TbGe3fhSjsUcZRzGm6IBRzAttpbKKQscbMdnwuMmBkNEHnSw15i7JZvBjsMjFsxQPhzqYB/YFk38I3Bm4VbyPHaKNeUlTr4iFMfxA6aZzpvRHPmr6pPMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbtLoEbGtLhERU9BLTHlxrkb3Mi4oouOO16p1uT7Ugc=;
 b=khxXIuZC9pmgWRLBDhIWfgRZgAdRbmiqSKVOZpzh92cwhnQY9/ueK0bBqgfgVXWc1vb55ZoKXsHo8cjtLgoVpr5fKmmBIhYP6/dv5R9Qq83vaqwK3RN1nBUq6qc8HJhmAF0Z6KfMwcyDkooeW+fev+0vNVTfByyMtVSGuW4/ofQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 15:35:15 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 15:35:15 +0000
Message-ID: <13b86d7c-6efb-4871-bbb6-620699622a55@cherry.de>
Date: Mon, 2 Nov 2026 16:35:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual/faq: Add entry about github pull
 requests
To: richard.purdie@linuxfoundation.org, docs@lists.yoctoproject.org
References: <20261102152932.846754-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261102152932.846754-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF00000932.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::82c) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 97da9043-b394-439b-0851-08df38f6e408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|56012099006|11063799006|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: DuRuQM7Pq21hrlA9r5WW1uobXxl5vTTl2Z99xS61WHBGIF6GlzycUEXvRJ9KAn2CqPXFRTHp5yvtnNUt+pT4533S+6C8Vv4WoLAoGSK8+DsI0TaFX9vW4d71DKiAc4OzF7SV6JvshCfvBceg1PYQ2MVfEGnMpklW34QCh+skrLSMPpUukIworwTzlKlGrkJjJzy86Xo9PIt9eLi5jyHIdwYLjRExNh5UXZaNUu+5dkLpxRWQ20jBUlnMwGJTWWXVPDdKv0FGVS9YcDImJTOe4v40ZxSgHeT1QsLBueyLbdFxS0nn+C4QtKxFb9LPwjFFcqihp2hbksWiUmBSXcSyY21mUS6mNmxwSo+4IzaSO6J83GkUwiiRZP2kmEIIIidWMRIEVqIH0BmisMHeEE7hpd11pRJYiuXLbi6yAeSldBxS1GxNzNRjJ/1qaScrhmDLWfqz/R8S1M25qaas+Me3dAN61mhhGcVp/0bxpwKt4CLfzhhlP8rKHTTsLrKOF11u1ocnZ8g9tp8wkbhJirE32FSLm/WvId/ZzfTJjztzpKKGO9ktebuZPYEQ5gatCF/oc90xvZg+U8Okh2mg53gzSRCwlUlWLcPPKuLwpxSLbJUYWOTvqzWHvdyLQya1J/EVbgLCXfdD32C7/OQ0BOE5N4WkeCMGYiDqimgo+9Ou9z4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZuQVVZZnR6c0x2ZDNaWkxVMkpLQXZNdXRpRS9vM2ZuanZiZmxaaWt3b2p2?=
 =?utf-8?B?RFpBRk5SS1M1bHNIdWZYb1VjaVF3eU9QUFZmUE81N3UrS3FJbm9ncTBzdEJq?=
 =?utf-8?B?ZXZXODREV2NqT05SOW1oYjNjUFFBZERzcTJESXc3Y2d3UGx6YmxBVGw2NHZN?=
 =?utf-8?B?S1J6bUpIZVF0d2pDQVhjTlpIVjZCaTBlSGlSVjVNcFlZenZFNXY2ajc3c1ZG?=
 =?utf-8?B?YzltVFNIQXZRcXF0UnNJKzM4UlFaK0VGbytuWDEyNHVlYjk3N0pCR29xOVE0?=
 =?utf-8?B?NzF4R0VFR0RlVlVHdUNIMDFqT3VUcHMyay9PMGZiUURUanpzTngrcEc3NkJy?=
 =?utf-8?B?amkzeG1kL3E4YUJlQldUYncxWEl2SXJ4dVZMWUc1YThVZWVLZzBLdDFEZU8v?=
 =?utf-8?B?dnhTT3A4Z3FzS3pKQW5RYzUwK3I5Z2J5bmVRWXNIK2g4eWoxaTBidFBWRUZ3?=
 =?utf-8?B?VHpneDBLSWFBdjJZNmZiQVdjdGF2ajJjd25rVytXbk8wNitsQnVtSHI5QXpi?=
 =?utf-8?B?RDBRSkFSV3JoTWgzMUlCYUNnQ21pcDlVUWpoOHhacXZLMFUxN0Z6Z0tNb3Uv?=
 =?utf-8?B?MHE5QWJHejJFNlAxb3RvT2t2dlRoSVZQRk53RDlmTXlNbDFIdU50anMwZEFI?=
 =?utf-8?B?UUQ0ZS9FWTBZaVNpanVMTmlEa1V4RTZnNUhjd2doL0tKMmxxV3prbWduUDBQ?=
 =?utf-8?B?dUswWWtPbVRmRnd0WXRwMkpaZlgra3h3L0xnUjR2MTl2aGIvdk02NUpmTmRr?=
 =?utf-8?B?aGVhUjVYZ05zaVVVSEhVTkhlS3FzVnNoVlB6ejJlYUZzMkxYbHhTVjVhcStV?=
 =?utf-8?B?N3NGTXdtVWVoek91TXJuT2V5eC9ScUxsU1gwSTNEdU5pTVVwemUxZVdhbCtC?=
 =?utf-8?B?ZEh4QVVjblhZZWliQzlIVGNicGI3a0hocCtoMjRRRHk4WEh0WGVXcHpyMlB6?=
 =?utf-8?B?elhyUUxFTERJZHdNS3ZXNStZK0k5ZTh4ZHNmNk5LMXo3aWZncGRhWFVqcjJo?=
 =?utf-8?B?MVZtZ0ZKSEJMaW4vb3Y1MXNKbi82YldkajM2ODlKNUxNeTF5Q1lSUGRXWEN6?=
 =?utf-8?B?d0s4S1luaFJsNEQwVDJxTW1rYjBvVnBROS9pSUVrS0tXNUcwVzRrVmdKVUlD?=
 =?utf-8?B?andGa3hNbVVRWUd1cmhNbGdieWlFbFVVN0lPaCthQy9DSHpLaGR0VXFXQTVt?=
 =?utf-8?B?cXd3MFVXY3VhUEM3ajNqOVhZZTBVWTFnL1M5RmVJMDg4eGZ5K2lIQ1BxTnkv?=
 =?utf-8?B?eUVMTjVaUFQwZ3J4YW95RG5lTXR3d2JxOWtjeDFaZVhLOTFLUFJOVHBXUEx3?=
 =?utf-8?B?SXNVYVFHaExlckREQUhTVFlpeG1zZE5URXNXSDhtWkFBVmRkb1dqcGZ2dU1t?=
 =?utf-8?B?RmpLT2l0bDlFWW9kVUJyWVJWazRjNmRlYWtHSkIzSHpCTFY5Zm54dkhZN1Rt?=
 =?utf-8?B?b3VBQVAwTUs2cTY3Vi9FcitaM2VndlkzQ3JheGtsOGJ3WmJPbTVrWnEraFN3?=
 =?utf-8?B?cldOWGk4a3pMTnROcmtSWTh6d0FRcVZ1N1Y5RHFOYXdMcW83SzZjS2FQTmg3?=
 =?utf-8?B?YzcrMWY2aGxqVzFMbjJUV053V09vZ1ZzK2FzcTF1V2JhanRCODVSaTlYSDU4?=
 =?utf-8?B?aW5GNWR3UTlJY3lSdUlXcTdrM0xKcnhwb2pOUUFFaVFFZlNxQmlSd0NtWjJW?=
 =?utf-8?B?cXBBQjB5bFl1RmJua1IwWHZvM1JPbFZXWDYrNjRJT3FPUGUwUm9DMWthQW5l?=
 =?utf-8?B?REcwUTEyc1lMcmFhaEU5alJlUEtQUDdmUFRmeURyRDdXblliOFppWTdwS1Rz?=
 =?utf-8?B?NTJLS25ld0FQd0p5ZVc5aVQrQmhpZENDMkQ4YUkyanlRckp1M3JYOGNzVGNP?=
 =?utf-8?B?ZkdOQmdWblBJaW0yS0FZOUhvRnhUWFcveDM4dDNRVEFUTERXSXVwbS9Tak9y?=
 =?utf-8?B?cnY2S1pOa0FBZ01qTUswUVdVaWNncHBnUEJIUTgwNUhicmN1WjRvYVhDTExL?=
 =?utf-8?B?cmNaYkRZMmpROHZTVGZ0OUk2K1VGZlRQRlp0VS9uYjFINjQ3Z2xJR3FlMW5a?=
 =?utf-8?B?b0w2b2xkMUZLN1Y0V290eDhwRkZYUUplaHZ1cHJzUkVZUmlzMVJYUEpuMlBG?=
 =?utf-8?B?S1Z3aUI2elJNTXVTcVJnMlgyQUYvZ0c3UUM4QTY0MVpPa0dTd3Z4VDhuUW5h?=
 =?utf-8?B?T3FZdm5zdm9hV1FtN1E3cENHRnVrS0ZaL1ZSTTkyNmZneGp3NUhjUlRpaEJP?=
 =?utf-8?B?ZjdBOHJXL1Y3WWdxVjZxSHVOOUNGYU1Xam9pOW1LUXRpVEtZWGFtWHZ3RFRy?=
 =?utf-8?B?b1FlRDBIaXl2UUFubDJKWnQyRFpweUc0RzVDMk1jRThsdHJ1NnNYZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 97da9043-b394-439b-0851-08df38f6e408
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 15:35:15.0505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERDJ90eYX2LxXQ7/C+iRuC3dSprO6qSUs00TUMMdv4ntaHgvcUMBh91sa+63VUIwsmy9oAtLnberaRwyn2MKbNka5VSvD4IzN9LrC5o6Aqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 15:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10765

Hi Richard,

On 11/2/26 4:29 PM, Richard Purdie via docs wrote:
> This is an emotive topic but try and fairly document some of the pros and cons
> of such a model and where they make sense along with why the project has made
> the decisions it currently has.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
