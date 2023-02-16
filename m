Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E401DC636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 10:07:28 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web11.6852.1676542038941998086
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 02:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=V+mD8l/l;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.85, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNAqY7UhmlSPHDzjS+BUHSe5/58rTOW2wBgNAlTUwiVABaB1oZ6etxI7naC8AXeHFIa2JL1W++WHsZmZZ4t/EoceoJpH3DEwEwwKVkmWxPfiyZs0a3H9VVD0/pZ76a6X7LCwWuIbJiyBnFArrfpeg1HzWXO4zkcusrMJ+CH3aXrv41nuxaMhH+FOvdYRHl9b0OlYBqS1vz3DFtCKkr2gcAnaWh7Xf+Kn67Nl7qNapw/KpPnIK3aFwvBsKCiENLqt2wr7xvVz8hkCW1XEJe44I2PTxFlfP7uJSj+HCWsSxyCDnGldPcUt/EWXjQ+fPnU4afoT4DreJLg2L5jx8QqvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeVaLHYh9mZP05F1nV9iVPJyVd5VSq/+wPQrz0y7b5k=;
 b=Glm+pORxtztUP+KpAd8N48w5qSCZHhYBiqh0d4x3CAS+CbvPkFoJSJZI76SEbCoE4tiIiUcdHEQxqX6r1/TYtRa2Oj8puEsUzArMNPp4sffe/BTjJJm6ARSLug+bd7u9tEtKhKM8BUXxodYU3tGPp90T5F88Rv9iqNfYCijECludPJ9kmtusvCA/NmYVQ5xRGIpPqJQl2uGQg8g8RyIcXkyOWJzc9Tb1lZ8JvxMrVzC3TR9oFmgGywL/7kIQ0hzK6UrYJ+Kh2TeNOzkzCdQwZQyY471c3xcZCzy9vtbBWmou3jOTCaU0B4mAn4insrmfm4/oYzK++CP42lTaZGwGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeVaLHYh9mZP05F1nV9iVPJyVd5VSq/+wPQrz0y7b5k=;
 b=V+mD8l/lO783SE3qY12Hle9NiGYP30AIJilYVWSuFWYo3GkyfJk3/i/yzNsVSbzrAO2ON2RRlpADWM5ZNtvw9Da0xLHPuU8hK6TOg2/Mz0CWosDYfriq0qSjDmYJz1XpF4k3o1CEDB2A0RXHNStvZapJdlW0SFXsfdSzPLghZiXR4GV4vZpEfSVJM0055acmDbq+pFKp5PqeFZwa+lupLqwFlVrNwZHkDuygMuM0AOHA72Ye5ypPPtmf5lK5jAypbqX4Vd1FPp+IJ4d+cHyYxOWZbSbe0334lstxCQWsTdPOvvmuiMsmr0Jhm/xLddAMD9Q4CN7+TcMmHgQFcz4GCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBAPR04MB7383.eurprd04.prod.outlook.com (2603:10a6:10:1b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 10:07:14 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%7]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 10:07:14 +0000
Message-ID: <b9d9efdc-ca6d-f389-a7a9-d3a7b0ed6f94@theobroma-systems.com>
Date: Thu, 16 Feb 2023 11:07:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] dev-manual: new-recipe.rst: restructure examples
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20230215095802.108698-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230215095802.108698-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBAPR04MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e2577f-cb2c-4c29-a11b-08db100593b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NQ4Yx/T4jAGbjQMdcxDDc2/GiwWQpP4edd1NZ7+B5SOGDAGnlL3epCn3EImTrGPv+etNJiNqDcJZfIwyoA8KWMOZmwsP+vLAKdd70yQQgPxI+ELeo9EFm72/8qPg3uGmKP9z3uZJ9o+OayPmYsgfOLm2mfqNNemCOmtUPAJ+byZ8L1Gh3XBPBcgs0NkjcUPcujx7nwGpYvcghPg/FrpxxMUTfmEw6qxLMrKu+0qHd0C7RmS3TcPs+u0SSwgG8tcS9sGREnhybZ8piRE/qkdC8NedULrhNYk1fEyvu/efCKpB833DtM5u6Un0TfhyfUHBglweEqkOI7hfpFmnGhDAl2TGdp65Z9CGzpv9WxMo2a1MwBVHw0Gr5mo0rdVGZ7tOm6uDpLVHY9TE1D98ld/e5GbhOpS4OHhTRlrEoWK6AmGXIM/fM0OPRA8/GyTRhRPwqCCOQMYhxQ4YrqjA8xBYy9CWQEd9CwFu1zDedKfn7A0q5GJOPJJKvRLkvaNNZZr3RFqzeByHuKkMzoTI7eyPhPy/iveG51A5FRiZl9MEeLUlmImLPGqEUIGrRNKftan+uyY0gNe6YweHT7S42fmXxeIyVi0RsZH3aWr0/8+1UIH5J472WnInV+BnBwq0ahv9x9AYm8o0VAdGHA9o2DQXZUNiJelKNM5y673BIrmJTUZ55DVsAbxqZL4+TG5B1FFQxg/8lcGfVCqPs8N2NExu79eCS+gcgA71ewwhwxnTBrI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(39840400004)(366004)(346002)(451199018)(6506007)(6512007)(36756003)(2906002)(8936002)(5660300002)(41300700001)(44832011)(4744005)(66476007)(66946007)(8676002)(6486002)(66556008)(316002)(478600001)(53546011)(186003)(2616005)(31696002)(86362001)(26005)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjhxUzEyODRwOWk5cFpiMTNuRjczaHY3cTlLdWhKcjhTaVMrUlYzSDRyWFI4?=
 =?utf-8?B?OUJtb3FVQTNlY3RmUHNCZ2VQdGJjSUFmbjlBZlIxMWY4eFdLTFBjMHMwZUh4?=
 =?utf-8?B?Tmkwd2FlOWpVSk1BZUJYVnlnVTViZ2tkTXZjQk1wbmxMdEo4cm9IazVKL0Vv?=
 =?utf-8?B?ak1UanJuelFBQzJkNVpoWGt6QmNKY0NtV3JlZTcveUkyL0lwZGdGZUl1d2ZM?=
 =?utf-8?B?NGhKbTY0Y1Zpdm03eFlsT2cxb1Q3dWd5SGNnRFRQNm9zVGhJVUJqWVVIcnRr?=
 =?utf-8?B?cVE3UHlYQ0YyYzB4TkRydmZ4a3RUa1pKdlNlYVRtYW9mSFBTeXNoQWdsSlds?=
 =?utf-8?B?N0xPbmUwYkxiWDE2ckpMbjVXS3ZFUDNGa2lNQnBGV0t0VEc3dGlNK0RXUGYy?=
 =?utf-8?B?ZHBrencrZUxzVEpUTkE0U2J0YVhTSms2Ny9GT1hrN3Jrc09XcEhPdzdIM1lY?=
 =?utf-8?B?QnRCT3JpVHc1RTNidzBOaXlab0tWd1lpV2ZiZVYrV25WQjJ3bUY5OUEvM0Ey?=
 =?utf-8?B?WTVWVzViMC80cHdXdHpUelZsV3g4WmsxK09TL2dRdCt4L2xRcTJTVUxtb3ls?=
 =?utf-8?B?cTlPUW5xSzMrL0x6azhNcWNINzV1TDYxSWNFRlVkbWJWMVAzc0h6Ri90TVNv?=
 =?utf-8?B?QlVoMGhsVjNzSVBEL1RuUEtRYXk4ZGhXc1FiMmVjTlk3eTFQa2h2Q3RmQUc4?=
 =?utf-8?B?VVNGdlRFaGZaVmhSY0FVZDQzTFBBMkZCZ0JqcXRobWpBNFgwN0plNHpsbjJO?=
 =?utf-8?B?L3ZqMGh3V2lRaW45WitweWhZY29NUnpWY1cxOERXNGFGTGF4ODBsNlJRbndE?=
 =?utf-8?B?ayszMU83VmY4ZVZBTHk2YjdBNDVxbUJ6VHhkSGlFazM0VlkvMnFNSE84SHFh?=
 =?utf-8?B?cUJ0RkhwRm5kdmRXcGtidUJKeHg0RHFNK2d2SDJnNXRmT09QaURBTlBzUmkv?=
 =?utf-8?B?c2cwRWpGQVJUaXU0YXZLVnNFTEVKUFYwb3ZORGJMVzJuckVtbmNBZUw4UnZ1?=
 =?utf-8?B?bTY2TGRyNUh2UGVsZGhoM2ZxMU5OT3B3cWVTaGoyaUZFY1F0dkNtOUsrZ0VP?=
 =?utf-8?B?MjdieWRFRll3TTlpODdMbDA0LzN2VWFvVWNqQzR0bzBFOUZzc2xzdHBqOTVK?=
 =?utf-8?B?QmkrNmVuSEFHc3RNdytUODVJNkNiMnhIeFBCbWYvYi9JZWNlS3dvYUZ0Z2or?=
 =?utf-8?B?Q3ZsT2JTVXJrWVlwcm9EMEtKN2d5UktYbkpvYXVMa0FweVBLdnQ5SnhSSHk0?=
 =?utf-8?B?WVZ2SFMvSlJyOE1sWXVFZ01iNDZXampFK0dLYXpYTmVJOGtsZVNwQ3RTOE1y?=
 =?utf-8?B?Vkg4YUNQTTlVTU9CTGJMMDAyRVgyMm9JQ0F5b0RBSEozQlVoRG9YbUFwanRD?=
 =?utf-8?B?Zmt5aDJETFFpejUwck9EM1BzeUVKMkJNc3JkNW1NRkQvTVkwU0VWeXlBWlNm?=
 =?utf-8?B?YWlWTVlkdjhmek1nZlNVVy9zb0l5blNQempGZnMyd2lDcXRRUEkrYjhiV3hG?=
 =?utf-8?B?YjM3bVNLMjVMVEtMWCtKejJMKzFWQWo2NmNHR0QyNE15Z01uUHJSU1NVYjFn?=
 =?utf-8?B?bTAzREx5UzQ4c1pzaCtnOG9vSkUzQTVVcEZPUWE2RXljUnpXRXl4K3E1L0FT?=
 =?utf-8?B?TUVaM0F4djJDR1hLaEdkM0FQVGtPRlR2cWhxN1FFTTRXVFBGbUhCWnREOWRn?=
 =?utf-8?B?RHJKSFdIcWlTQTFocFVmOFlFT1lnZVNMQWI2eTM0VVpmdkFyTUJJUjFGWDVZ?=
 =?utf-8?B?NHpLYjdYaEJNWndEd2puTTRIcnluNTk5ZnhWNGQvMEV5MzkyS2ZaUityZjhB?=
 =?utf-8?B?N2xQOUtYUVFFUXJlQm9jR2UxZUY2czJ5K2paZnB6OFpnd243TzA1RE1ZRUlK?=
 =?utf-8?B?SDBMV1dJempRZDRtNUhtNndpbmtJRUpwRjg1c3ozRmVoQTczYXRGcm9MS2RH?=
 =?utf-8?B?WUxJRzNFVWxqOHRHVmtDNGpLY2Q3dk1PSzFxRXV3R3BRSzVreFBtM1VMUFpn?=
 =?utf-8?B?NlJxNVBQRGlaR1lkVHBaVDJnK1lEalcvak1iUUx0MTkzZWpYcktiVkpzWXFs?=
 =?utf-8?B?YlE3UkNtUDFMZEdBbzJITFA3ZjdScXJPNjJyOVAwdlM2MXppS1FPUnFMdHRF?=
 =?utf-8?B?MzR2cmVFeEpmSGlvTVJxMHpNY0VTS0dTY0xEUnVPbzBDOVd1OVFLNkNzUGRX?=
 =?utf-8?Q?YIij/VRzBPGXKjKXTbs0dAY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e2577f-cb2c-4c29-a11b-08db100593b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 10:07:14.5775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KQOg/skFPpvWqNyCfhQvyZj+irEusWJG8/qwZH/klhZpiiGK0TT34dawhHsz4T9UpAAasYwNvH24vNqfMY5BGPKiGI1ISltCrxS0cy9R5zhJ8h56o9E8BI4WZ/bSzjS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7383
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Feb 2023 10:07:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3693

Hi Michael,

On 2/15/23 10:58, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> To make it possible to add more examples (CMake, Meson, Go, Rust...)
> - Change section title names
> - Adjust paragraph line length
> - Have the Autotools example after the one with a custom Makefile,
>    corresponding to an increasing level of complexity.
> - Clarify that GNU make and the Autotools are used to build
>    the applications, not by these applications.
> 

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

