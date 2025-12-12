Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C881FD49203
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:40:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10905.1765539631819064184
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 03:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SLCyPQ7x;
 spf=pass (domain: cherry.de, ip: 52.101.83.5, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8tJLYD2dpYEJWDkaK+QS0njmK1P9ktL61lKXqhqSHn/mEd3A5QOWbfIhdBB6Mn1Lxzvp+R+0ddA+pelqWp8rg8Uu9X/JevJmFZ9IJGDGdtCAH38fv4TWNtWCae+NmXRfikyGYCFFK0526Rp/RqpQKz3KN7pyD4He1U2vhjFqnXOQDgJQIgNrxWM3d+y/ag5PX/fa8iP44394luwQfPr2r0LynB5hAZSW2XbsTs0sOtUtpmLbOqR4YXe3CIqW6Qan/Dfta8iJhfxbxQooGpd6ClG75cl4HrDJOsjci4VfFYzByubvnZe9sxnplxJ7tHD/tENzAs8MDO87i799ajO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5gA1nI3yQisRY/Yt1v5yIbmFyxhGQQnpw+GQjSJEFU=;
 b=LFGLyYxCqNVrYLfuZaqDAJVOsfggtRSIf8RlOyqF6bD6qDRMJ/aeHIyzQ3ktBBuGU6wvnizJmnAB0XZNUv1OnTa5jFR74GKCcn10hCL52HmeI8PlbP4Fk0CJ6EXk31rxcWAsGLI+QSp1YxDgfvTyF5urMRD8QtC3vyimW+4DNcgyyYPj/I5Za7jqmVu2qSoxpSywW7gXtY/eQlPLCNeowO8y7ygqei5c9kCtb2EPsB+k5/Hg4wX59ZKt/gz/4mAgUIKPsDPnrTjG7ohV4uh1LhT4Hake+ZtXQujmGrrATvYz7TSPOoGJliN4kG6P/W4RmazKti+CrBkB6U4nlnTSIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5gA1nI3yQisRY/Yt1v5yIbmFyxhGQQnpw+GQjSJEFU=;
 b=SLCyPQ7xxCezoKzLwEWXGi3IIF5MYc9/5YJ6me7cLm3eQ+98vkWOTEqQ6DlgZEK6/6y39JcIRI6eCC7x9Idnt456155WD38bfi6xP5xuv7nWYHowGrr2OvE0GzLPIFa7W544M0mCTMDPSBrTrnXJVkdXy8/dfJIdjYcdgaO9+mY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PR3PR04MB7324.eurprd04.prod.outlook.com (2603:10a6:102:91::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 11:40:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 11:40:14 +0000
Message-ID: <c2771b02-ebd1-45d8-aec3-09d543ef3703@cherry.de>
Date: Fri, 12 Dec 2025 12:40:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 3/5] tools/build-docs-container: add CentOS
 Stream 9 support
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
 <20251212-build-docs-container-tlmgr-v3-3-a45c1ce6d8f7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-3-a45c1ce6d8f7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PR3PR04MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6ff969-b5d7-4885-e353-08de3973370e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q3N3Vkw1dUFpWTJtWXlUaVJvOUt2blQ2dHNIRmkyVGU2cWxpV3JVZDhuc0Nr?=
 =?utf-8?B?ZGVzRDlkTFRuZmhudFBwTU4rT2R4aXI4SFNaaWVpN08zZFRyU09BV2l3WHFk?=
 =?utf-8?B?cFBVNDdkK1FVRjF4dkx2VHV3TWsxZ2xLMTNMYWR5WHpzTldSUnR0dFFEN21s?=
 =?utf-8?B?SmRiTDdQTGZ1UVd1dGQzTlVqTm84ZGI5S21LVnE2Qm1ua3FDckZFN1dQQTQ4?=
 =?utf-8?B?VndOL05ZRHNiaEYzakNMa3NyVk90RDBpYUJVR1ZrUlljVWJQaXV4cXZFcFNY?=
 =?utf-8?B?RlVNSlI1amR3Z2wzZ1ZESllvNjE1MzBYVVFwNjNUZnpFMi9kUHpaeFFnQnZK?=
 =?utf-8?B?ZmtMNGhQdjlJSll5WnA0ODllaGFISDNNWGZkZkJOaWNSK3FONzh0MWtrd1Bp?=
 =?utf-8?B?VEh3a3RKZFFsWXlQVmpmZVNTemxnZzlOU2h3TUJMNlFjRHhIa3Ywc0FzM3ZP?=
 =?utf-8?B?M1pCRmRvWVY1MWtkWkRVV1F4dnVCeUVCRzlnMDZzS2Rqc0dSQ2dsM1BzZ3RC?=
 =?utf-8?B?NERZRjRqcTB2UzY3aUt2RmI4Y1RKQ2Qxdk5XWng4aURjVElpYUtIKzl0cHdH?=
 =?utf-8?B?QXdyU0RHLzdJb0d4TzY2MTk0anRKYVRVREswM2ZqOCthenZXMEs0MjlJNElT?=
 =?utf-8?B?L2RHUkJWVzBzL2h3S2dRNUxxTlJJcVVmM05Dek9GN3pQdE0vRzBseVVkT2NF?=
 =?utf-8?B?dFIxZ052QUhSVTJxOXZuTXYzdGFiQ3lkK2lGK0QwMFN3eTRmS0dlMUxGRHl1?=
 =?utf-8?B?aXphU2puK05kVXUrR1ZlSjNEbzg5ajhiRTR6eDBPM1hqK250MVg3QXFBNHNL?=
 =?utf-8?B?c1I1UG5VdDRMVWhIZHB3WVNIUzNiTVJ6d2xmTkxVWjBKY2lkOW02ejhLa001?=
 =?utf-8?B?K2d1NWxQQWVScytvTUpOeDVBaFJIOEloZ0dsTlJOM0F0U2hkdEYyWktaTk9R?=
 =?utf-8?B?YzdPRjBxdkFsWVI1NTNBaHM4KzZmMlVLSnBUZGNMWUVmbTNpUnZXeUsvNDJW?=
 =?utf-8?B?QkZ4RGRVVC9pVjBTZGRtRHkya3BGZzI4MjhzUjY2eGJDUHNxeWlaRWtnRXd4?=
 =?utf-8?B?TFp1LzBYMG8vem8wMDRTY2x4dDZFL3FZb1dIU21taGcwdEZ0YVMrOWlHVHYw?=
 =?utf-8?B?cHltbDRIbUxpNW1NUFJWZWIwNDlPVzlpcktxSnBWTnh5bmdIRzRjcm1DbUdy?=
 =?utf-8?B?M2pUNW9ySUVFeW9BSkNlc3gzTk9pUVpjNFFzRVJkd0ZUWitjMlF4VlZDbUF5?=
 =?utf-8?B?djY3U05pSW1EbnZZWmZRdE9kV2xwVTVCYkdoSVVDZS8rcGFqaE1JRkZ5VHlN?=
 =?utf-8?B?bDJQSTdLYkVnZ0tyVVd3TlJLNk5FVGttQ2ZGWmlXMDFxS1grbldTUldMVWtZ?=
 =?utf-8?B?Q0pEMEQ5a2pURFRHMVJlL1FpbkhIcU9rSHJ3WDBnK2JKVlJlc1BGQVFWa21W?=
 =?utf-8?B?QlZOSTdCZE5UT0ZsNU1vdVNHelRmRWpRTlZuUmVjZkUzL2xOWGtTZFB4Sm81?=
 =?utf-8?B?K3BzcmJrWlpLc0gzVTlJQkFaemgzdmxGTWgzWXk3K0tXL3hOakIrL1Z1Zm1m?=
 =?utf-8?B?ZjZrNnpOa2VEOFlScFlmQXVlZXlrVUh4ZWFyVnF4enEvK1cwUFZMVlpONGF4?=
 =?utf-8?B?bzdJQjI4ZVpjN3RCS1NBMEYvZDV5cEUveUZ1MGxoOEVPUzdBRHRmZ2dyc2J3?=
 =?utf-8?B?RU1Qa28rQVhyWWVZN1d6Ynl6NkYzMm9ha0tWSlozTzF1UVEyWGhSQVRvZHNV?=
 =?utf-8?B?UWF1eWxwdGNkcjFONkRFaWwybWQ3aTJPQWhTUCtkcit5YkJ6d2d0ZjAyRXdw?=
 =?utf-8?B?dUFkTXptNGpSVUNCY0IxQ0lPZXR2T1pURGk5U3p0L3RwWWN6NWZacStLK1d3?=
 =?utf-8?B?VlJXOVMxVjcvaDEzK0pMa3Y0M2pjcGE4Z2NERVNlSmNiK0I4bGs1NHVlUXkv?=
 =?utf-8?Q?fLVMkWDRWVyIR3tuwbeE9gPKAdZpafod?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3pBNXQxdGwxTUg3RXpKRzA5ci8zS29VTk1NRmZGU2phTXR6VEJIYjNQbnJv?=
 =?utf-8?B?NGhqbXYyWkg1MFV1ZWYzSTZqaHZhZi9DR2VFa3BXTjlxNGgzUmU5SHV5TEhk?=
 =?utf-8?B?QzJmMW9jbkk4OGxqMzFORFRoSUVhVENqdkRUWmNoVzUyWXN5UU1UNjhhOTNn?=
 =?utf-8?B?dzlXd0RSeHVqM1FmaTFWSWRXbU1DSlNxS29RVE5QZHNyZ0FuSVcwbjdxRjBi?=
 =?utf-8?B?bkllTm1xdE92bTRoZzRPQ3M1VVpQbEN4OEgveVFuYm8wblZ4d1N5RmJYYVNr?=
 =?utf-8?B?b2JINzUxTEJJZ21FZnNkQkhVU3F1MXR3aVc1SkZUbEZXSDV0QnY2QnJ4VVhT?=
 =?utf-8?B?ZHRlSEk0OFREYlRKWUx0T21RNlgrbHZ3dVlOM05jSGFsS0lseGlzYStCNkRu?=
 =?utf-8?B?a29UYW9YYm44OTNjVVdFY2E3TkY3eFZhcU9vcmdRNVNCMEVmMjBJOEtaVzdN?=
 =?utf-8?B?WTZOeGhkdFFaSHkyeXltWmE5eHZWbFdVVjNhM0VJZWVtcEpHMlRCY2pldXVu?=
 =?utf-8?B?dXlSbVhhTDhiaUt0QW42ZnYvRlhSNisyb0NxYmlTZlJRMnJRZHBBWndycnI1?=
 =?utf-8?B?TjZ0UzFXa1RyR24yclo1d2c2SnlpcUJlaGVSbmx0Q1hYbkE1M05PSCtSekM5?=
 =?utf-8?B?L2p6NWJHa1BKTTdQdlBXdFVtR2FJVEcvK0Q1Y09RRmhYaXVVcUZUSmFQdnRX?=
 =?utf-8?B?UERyTWNQZGQ2MnlXVG5EY0RBdVljb1hjYVgzT3pCQ3FhcEZDK0VKcWNzZGRE?=
 =?utf-8?B?TGZKUmcyV1hlUW1UdVpxRGQ1Tm51NHpsbGEzZ3czRjc3NFlWczloZE9nNDRp?=
 =?utf-8?B?aWRFd0ZRQ24wb21TdCtscWk0UzlIbnJFc3psSUgwMzd2RjBhS2Y5YVJtMVg1?=
 =?utf-8?B?RVV5b1Z0RTlnMjYxMDc3bnBzcnZDNW8wQzRYSEQ0SXNNaUdZOUpjQjhEeVZi?=
 =?utf-8?B?S1dNcnFjWVBUbHE2RU9KYys0UGRmc3oxMjVSNDhrZWFJRXZiYWF6eCtQcTNM?=
 =?utf-8?B?WXJENUNHTzZHTWlvckd4b1BhcGwzVnZURWxpZUs2TFBBR2k5VitlOC9hYm1X?=
 =?utf-8?B?cjZNWXEyL2podmYzSEJhQnVRYkx4Z3FWN2RZVFY3MDNyenlNcTQ1dk44Rm9D?=
 =?utf-8?B?bXdUbTkzdHVDcllURUh1Tjk3Rnk1a01kME81OHBRSm5hMmoxUm9vNUFJNi9k?=
 =?utf-8?B?ck0yUnN2TFBNdjhQQzRwRlh4UXR6NFY4b2xnVXcxV2tWWjBTdDV0OUZuNGdG?=
 =?utf-8?B?Q2hxTmtJZ284UU93dUIvdllMK0RNZ0RFbHRMRCsvNzBDam1JeXdqeW0veVMx?=
 =?utf-8?B?U3VmeXhXU0l0L3Y4d2c3MWlZTmVSZVkrZy83Q29sdERyeVlBY3FSQjZ3RTVS?=
 =?utf-8?B?bzFHMG9PRnE2RVBHSXJISnI5ZUg0c1FycE43WEc2eEkvNS9Vam5HZHRBOEln?=
 =?utf-8?B?Z3N5M0orYmpVQVYvc2JNckRYOEJFYkQ0dDd2K1IrU3hpdHVWTHk1dFJNRHMy?=
 =?utf-8?B?b0IrQ1JzN3JUejRVcVluMnVjZWQ5dEhvUnFKeGdLMmRiWi9ac2tnOWVvZ1gx?=
 =?utf-8?B?a2ZUZFRPMkxsYTFVSUZNRjVZSmYrb2lJN0NDNmdPQVgrUkdnM0xTdlB2QTNO?=
 =?utf-8?B?MUdWa0JKSmZDcFVVaTVjeTV2OVJON0ttRHA3THdUci9UaXJWd1BzUjM1SGJB?=
 =?utf-8?B?dnlXMm9pYklUNkdjVVZlS3RPN3p0clVxL05meSt2ei82aWJnR1pDWFdvWUR2?=
 =?utf-8?B?a3ZFVUE5YlBsQXZBWHJyVTNENlZad0xDQmhxY29Rc1VrQkdNa0tHRU8wYXNn?=
 =?utf-8?B?SEhlV3JZTWZMNHEvWmdDRjh5SnNYajdMOW9ndWxRRkEyNzZrUWQyd2ZYb3Zt?=
 =?utf-8?B?TlFERUQxSkx3ZEJDWlpzUXoxMS9taXJpNWcrU2RSb1lVQWVtcGx5UWI5VkxC?=
 =?utf-8?B?R1lxQjZFcTJlUnVqMFluQmQ1N21Wc1YwRUtjZytId2tOUlQ5MXBHaFFPb21G?=
 =?utf-8?B?djhGcTZVRUtYMndkQXlrMWphenJqNGppZkZpV2NPZHZwOU5peXJDbHI5WVdQ?=
 =?utf-8?B?SlVFN3hLWkc3d0ZsaXVwSUpSSFRTRTFLekdScjRSQ1kzYnRoN000ZWJWZzA0?=
 =?utf-8?B?NkJ4TC9PaU93VURpd0FzNThjKzF3VXVyYnhYTzJUeHJWakZzdFNRaGxFaENr?=
 =?utf-8?Q?/h0Qs9k+ca4kzzV+L0lRrSg=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6ff969-b5d7-4885-e353-08de3973370e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 11:40:14.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0xHVJcAUpfbPyzCo7JceWoE0dv+cdttKk84T/NDoUnW5UmYru2T3BGATn72anFuTSDkyJdiCHkppnq9e7BvHHPVS9Dgw6Cj5x9dx/SQvfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7324
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 11:40:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8268

Hi Antonin,

On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add support for building the docs in CentOS Stream 9. Use RedHat's
> container image from quay.io.
> 
> The centosstream_essential.sh centosstream_docs.sh are symlinks to the
> almalinux scripts. Just pass -y to each dnf command as it was a problem
> when building the CentOS container, and isn't a problem for AlmaLinux.
> 
> Introduce a new installation script: tlmgr_docs_pdf.sh. As I wasn't able
> to locate all the necessary tex packages to build the documentation in a
> PDF format, I resorted to using what is used on the Autobuilder: a local
> installation of texlive packages through tlmgr.
> 
> This will allow us to provide a way of building the docs as PDF for the
> distros that lack this support at the moment.
> 
> Export TEXTOOLDIR in Containerfile.dnf to pick up TexLive's installation
> when available.
> 

Looks ok to me, haven't tested the thing and no experience with CentOS 
or tlmgr, so

Acked-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

