Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903B7F3093A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:59:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41850.1772708381128593844
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 02:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ce+p9Y1G;
 spf=pass (domain: cherry.de, ip: 52.101.69.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAZmdiTqDXb5F/t85tmG89f5kVSVOE2HSmNFMP8aqG6JVTVAyiB91HahTUSyDukyuCNtl0GHo4JZDyY7NddaKNDRjhjt51W/StD2ltJCg880ALtg5ZIrSpuM2ImhYtIGeYOVFO64e4LYW3nGR5KdunHL9FZ+YzPOyW3PYR/+vu7AvUzRwMMGrYtzVVtvUMfrMkmQjJeihjvI2doL6WPoLf3HxomrPVjWj9sR6BMIF+uS8oiBY38xMLSXDnH4ZdHY3p6YdCyX4IbRgPW4bAJ44dSNQ3Zx98eCVSMG78ZabFD4pf9tUlrWZV0ptNiAn3H2HzpN9z2YxdqI/uEX1xtNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu+FuI4KNmZAgZDium4HLpaGl7RE/jZeDLLlg8buGGM=;
 b=BdLc8xCoT62sOGz3gA5fmg+F8DdC/LzqIw4ypBcvnugccV0hdf6CNEYLi8fnHMpTt21vn/yK2zz4q8W7LN8s087i36kzTl60UKXa9lmBmORY48CJjQDzWsaKscam571NntPqqG30dl5O4eYCheMMr4/wq8PyHHpI8qCIAjbKDoMPMMVLM6dCvqElO1TW8JfJ/jJG48bRD9GO9pPqH4hl4eZ06aLmkwM+gienFHYCkAXIh7y9OJwcExW7/pvIp14ShflANgoSXX5KyIRjUdQNTYlSnxN5j+EiKxxurCctG2jVqpY3ZxKCFy9oXu05/D/iLexKEtbVAgZO079matyARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu+FuI4KNmZAgZDium4HLpaGl7RE/jZeDLLlg8buGGM=;
 b=Ce+p9Y1GyN9dd9tNA4aRn9UPYxSoFYKKP8cAHtG16iM6aWczomfx2qUtmrMKmJThiOzVcXmTB4/QKCA6zEpnmVTCCw+yaxIvwUzRcOzhbBnmJSVTD5xB+1gohBsuFI4ZJh1EIAu+WGePRM5GnO5lkq8Qv1q7HdV0e9aW7Cnv37k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7528.eurprd04.prod.outlook.com (2603:10a6:20b:297::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 10:59:37 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:59:37 +0000
Message-ID: <86d26cd6-efe6-4f5a-88e4-70af1f3881e9@cherry.de>
Date: Thu, 5 Mar 2026 11:59:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/8] ref-manual/variables.rst: SPDX_PACKAGE_URL:
 add missing parenthesis
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-3-9662dee58591@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302-release-notes-6-0-v1-3-9662dee58591@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bb8750-efe2-42cb-b044-08de7aa64ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	iW0a/K8buMGQ/hPV/z4RwjTs8XULLtSor5Oy8S9s3iAB58jQsr1AxYhWnG8IaPO3IWafoX1GW+dABthE6tkjQ+4IjOwgFxGbQK3JkA+jf2xpkQStbqL9JiNvS1UnISxulv5x1pMa4TZnMWyac6W1//xIGCL1uoK3ZutAZ0wtk2NQpxuh2AIAzlBd4l88eU7DL7QQe4Qs12FksdndslPcaWRqcUKcotSh5TsYXn7q5Z1Y/+KwVCGcII/qN4kW/4rjc5Cl1HlBwy80tgjioJVTdaloj8yq5Qhj/h/d72gHIOZbUOaLYfq3A9LzdOZdaBCzle4qK02/9Z9irSkLCcShsit+5glyX3aNeUll29bDa+UTaqHjewA5wr5YTNlYFPZnAl4bJuOUhkMNKhKYy+jZXso6SLa+UWE2OXKfcGhO5/M4sIBNRleEq1VMf3zbEi88VXMwozyRSNCcXcA5kKfGBqW+Rcy7OU4zVD9oIxmTXEloSkYJMpe2avn5ZW0pGNhZFgJgS6qGR2kCM8RNHTc7rllY+UGt6mWbCYM84Ame5E85U9n/iy0NEgl4w3nTPqlWg8CbKlFtAp4MCqhoYt8WFULM6zDu1Mz4R5MdUgbUe4lMK6oYqdIU5LogzU5Qn9Z1rsTe0sz3iPGAGMvGeAav6SOL5ezKDFfRi9MAjpjcMox8DAa5QO5wxE5T+mzX9B1VGC+6g/BIzeZyhdWQj5OrqEJyD/7SFTgGQXY3Sz8GgpA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djFCOEd6dmM5ZUdJVEJLSGxMYVJyTmFxNHl4eU01aVNVTnhKRWljYVZtQ0sr?=
 =?utf-8?B?WXhkQWlqMjdFU0h6Nm5BbFBhUzI1Tm53amlkanFDNms3dkpRY1lsNUpMU3dX?=
 =?utf-8?B?dEEwMDArbzBURFFHSHRXeXNGZU9BOEtJRTRHRy92eDRWVVZMWnYwZkRmdkZS?=
 =?utf-8?B?R0svblYxRStnTEthWm8wRzZGeEdaVTh6c28xTUdHTjBUaDI3ZTZxSUFZTk9L?=
 =?utf-8?B?Z1JBMkQrVVk3d0ovbzVlNjU4M0lDdVFFZWhJRjZKdGo0TjNZTHFQM3d2ejBz?=
 =?utf-8?B?LzJXU0hWTEJOVGFqNGRCSm5SMjFNOXJJa3ZaYnBBRFlOenk2My9XSWZMcFpH?=
 =?utf-8?B?THQySUFvQUVIc05ZZUJGOUllMEppUCtObU56ME1MN3hUdWxLNEE1SHpTcG1X?=
 =?utf-8?B?alNNa1hGV0RGZm5VR2NmUTg2eEJveHN3cFFTdVVGMlhnU0I2TVVMSXN5dWlO?=
 =?utf-8?B?b2hBZE1mOFplSHV6V0ZDblB2SFJOeGp6S3NMUFhaYnN5cDZ6UmVtQmpqaVlW?=
 =?utf-8?B?ald5SGU0c3RPd1ZiQm9iMmJFWFlrNHFmTGQxQ0loRXhrN2J3MEtVRHM3Q1hN?=
 =?utf-8?B?OTUzWW0wWHhQbGNnVVpaRHpsR1h0ZnBVTGsxd1p1cG1sSktqNTVHY2JxOUIy?=
 =?utf-8?B?VDM0VGIrSzdHdWFlMW1kbHh6TlR6RXlOUFBtdEZxaGcrZWNTQ1pXa0VJKzlW?=
 =?utf-8?B?a0dCQW1obzcvWVV5T3BkQmZMNmFualNqeHhTYjdlR0FFeVVlYzRBZkJuTVNM?=
 =?utf-8?B?OWVzOCtrMEFNZFErMUpoMmNsckFjNDZNRFRSREhEcEVWOGg4OVQzZTNWNDQw?=
 =?utf-8?B?cTNFbFZLaFQwUVZ5ZndYT1hUWllRcC9hS054SlVLMFFlb0dpMlRjdjkyTE84?=
 =?utf-8?B?blJSN0Iya0g0ZDV4MWI5c1lSM1d1SkcrV0tzOGZqdHAwUGNQcWhyaEJkUVhn?=
 =?utf-8?B?N0xNTzBzUmJXRTBvRUF4YmI0Y21iRTNranRsL2kyME5mdnZSSDBzSWVDWmZk?=
 =?utf-8?B?NitlUkpaQnBMUll5akd6Tjg4ZHRZNjFLY25LR1FUQ1Q1TFJzWkVLUnJkY0R4?=
 =?utf-8?B?WlZmcFdHbFYzRXNSaCt4Q3BLemcvZDJLUWhRbThXWnJLWHNSVGsxUDRtRHNS?=
 =?utf-8?B?SGxrenlMenphYnQ4Q0xwK08wQ0ZHY1pVcVNnMXJybEU4eGZ0eUk5SDlGbFlt?=
 =?utf-8?B?L3dzM05veVMvQXQ2ZUZaOFZtRVZMSnBNMDcwTm9lQ09xc0NPaURIOVB2VVli?=
 =?utf-8?B?OFNiM0luczRiN2M1djVVZVpVRU1vYVdwYWVrOWVwZnRUWXhNeVpHS05rU2pm?=
 =?utf-8?B?QzBhY25IR2s0T0xsbVIzVXJtR3ZvQUJJTFVvcGdTeE92WEZIb3llSEhuQzlS?=
 =?utf-8?B?bUY0aEdmVXJNYUVaUmpITnlHdzRoYWdKOGNGakZ3NHBnc1ZqT1JhVDdDbGlI?=
 =?utf-8?B?bUQwdkpxRGNGbkZBS3podjRKR3IwSWUyRzU4L3hndDY1SUpzSGJtTnpScXFO?=
 =?utf-8?B?OHF6dDFjSlJWcDFXNXJpNnd4OE8yMml2a1Z6d1pROVFWeDFFczh2SEg4U2RY?=
 =?utf-8?B?ZnZ6VHM1OTNCSCtRQXA2c3kvTmR4QWZ2VWJFcWNweURHRjFtNlh1SXBPMVZr?=
 =?utf-8?B?SHNISU92akFjTnM5R0ppNm9EMHlRZzI2Y0pSdEpFOVFTZ2FsbTJMV05ZQW5X?=
 =?utf-8?B?bkJXcm1meWxPWDkyZXM0QVMyZi9mRUliOWRyRk1vU29WeHVQZXVOeklvNTRR?=
 =?utf-8?B?ZkN0TEVhd1EzTDJzeGlvTE1BL2czZUlXQUFZaW9VQVlLZjhHbElwdE9BR0Ns?=
 =?utf-8?B?dVI2NGJrTDVRWTUvTjczSHdvYmIvWXV6NFBGMGt0dS92dDErd1h3OGNxSDNt?=
 =?utf-8?B?RW8vTFhCaElXb25zVHloWVlqejZ0cXRBSDZYUFN2OUxCdWVpWEZNZVFhemNh?=
 =?utf-8?B?TldPaEV3SXcvcG9NV3pabjlaK3pqcklDclk5WXNxL2k1UTFLZXpmQS82d0wr?=
 =?utf-8?B?THBaeEF0WDE1RTZreERCaVFncGlyZkZ4SjNxNkxFV0wycFB4N0VDK2YvVU1r?=
 =?utf-8?B?RlJaR0k2OFJtU3h1OS82S01NLytkNEFMcEFDQS95dGJjWXlhQVlBaEdMYkxT?=
 =?utf-8?B?QmxJOElFQ1RhSWhienRxdjB3VWRhbGF5Yyt6SjJKaDBZZG9kSlM3My9QUlRX?=
 =?utf-8?B?V21uVHN5SDA0bTlIUHVhSWcxWnlJU1lJT3UvOEFLTVZtYUt6SGtETHZxWVNx?=
 =?utf-8?B?ZVNhUnpmeXBiOUtYMU5kbzhiN3h3TG1OVHgyRlN4VEhYOTdhNXk0MElhNmps?=
 =?utf-8?B?eUY5RWZTQ1BXcFdITDhSd1IwRmxiS1VDTjdnZUlrTjhpb1VWYXNmbnkrazhw?=
 =?utf-8?Q?LdzRU6FocxTkjpL7Hf+igR4VrDGb0/EBKPdnI?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bb8750-efe2-42cb-b044-08de7aa64ab8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:59:37.1737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFAiPr0xZU8IU+n908/OkJYsJctVslenj/cdbOyrDBA6s5NRcZVKZfgoLT/j/9flKJnGQTEvKK3ucIEwsnWijwtyJYUeLUWF0f9YSVpgymI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7528
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 10:59:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9063

Hi Antonin,

On 3/2/26 10:37 AM, Antonin Godard via lists.yoctoproject.org wrote:

Fixes: 108549dae76a ("ref-manual/variables.rst: document SPDX_PACKAGE_URL")
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

