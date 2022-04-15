Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903C4C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:52 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.51])
 by mx.groups.io with SMTP id smtpd.web12.8751.1650037514707595930
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 08:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=abJO2Dbl;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.51,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE3B8vzF/c45lHzgFgB6jqZU0Kk5hYLfFc8DJZSELDiC+kBp4XxOvE+/zeQCpAovjId9Ic42wDyz8f3P7KOUmamih/qGjPMetagxRGzuyqXR/ckagQFtLUzxsPu2BWfFIxQNrQSUt9Mh1LIVxTXTEuSdHItFSYvmdopxmaIy/dln4DJ/d2eSwq+AdnbQRtiJnOq+TMbiBgaxR8EknWj09W5kq8vvPCv1GpWyarBPFStqxIvXxY7nXIGhnBkLIdj37GvX9fH/N/LzC7P0s+BX4gSx5HOYE7qEfEQeGBBRNBttcnuPOJ1mrQWnCesEDZRIzNQQOW53/WUBQlU7ab/dJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2I2aaM36rbExxA5uCLCGZCgRvKhbxYH5DrI5b4ttbs=;
 b=D0vPmGDA79fhQ81d3rlLBL4ayGcRNoETHAf0/5PlpI18v8LwTbB/WJ7OQNJ3gOx+TeuMXQWidV2BJwhGrqJaCD/DgPvpiVhnMxP59HlH6tZz1/yiosNd207tOifCKrzmtOtfyw7+RU+jKySTcKCyWI/vtzg2WvHzgQ+2mqiLTEAs0V3UkLILIAuWD8aIM9Y+eY4htyrrqVLGJWJhdew9SQPF2CwD67Y9WfAhq6IbbOcHMVO50DbZtldTnolJp2SbHcDf3naMHhvujC2XQE2GRpveGCNssfOtZ0gKAaZfA6NFzFetJg1bV5CHNkexOqNQbWq6JTCB0D9Y0a4oRzDkVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2I2aaM36rbExxA5uCLCGZCgRvKhbxYH5DrI5b4ttbs=;
 b=abJO2DblS6yu07vVgMT8ZZ5Hm2vlbIeh1aYIu+CMQ8aopiRvKzeptK1k9cmwVmQnU4p/xdeY2JcTqwIDmk75SuceKEe05b8jiHx07X0r0Pm8r224Vj586TeckLLZD9ttJtIVX+1Z3+DlEnnv0JF/hnrWwXAHYeXcjUOGXXeSGUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by HE1PR0401MB2650.eurprd04.prod.outlook.com (2603:10a6:3:82::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 15:45:09 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::bd4b:4dac:7747:3093]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::bd4b:4dac:7747:3093%8]) with mapi id 15.20.5144.027; Fri, 15 Apr 2022
 15:45:09 +0000
Message-ID: <43706131-36fc-dfac-11b0-5c63b4ee9d9a@theobroma-systems.com>
Date: Fri, 15 Apr 2022 17:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs][PATCH] Improvements for gdbserver configuration
Content-Language: en-US
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, docs@lists.yoctoproject.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
 shivams@gmail.com, john.kaldas.enpj@gmail.com
References: <20220415152848.364686-1-sundeep.kokkonda@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220415152848.364686-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0035.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::48) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7915fbe9-85f5-4392-a1de-08da1ef6ebca
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2650:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB26500AC5A901C91E6EC3B740C2EE9@HE1PR0401MB2650.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hcDfGZzYhFEd3ULHU2cYMfMBhEQoaVhEPiZKnXGN65XXHpk7AN6rdZXgyqCh7AHtBr6yk5opt90MWt4zHk8GFsUoVyclB2HZOrpujWQph81YDi2+ptqBoPLqBxGBw3PeGXsz/okjYwmNuHay2GJroB0SMsvNVU3XiGtuMOh2IbS193BLuWSLxpKzMwwbKmfEdLi1sQEQ5yjZrkmm8SCSMx/6BGPuTFAbr0Gx19IytZbT+BxS1onayNyaieTpQXGgQMz4jsIs/0zoat99FRnL0yz3UM62ehIM0w4ankmoTaE5TudufcWQC0XYOwEfKBKftfcTnB0EgRxsFKkQ2RtgviqPqubp2bwpVGrl9AqEJ/7joU4KMWcGN/jEAxzcIBORwUxSMCZY92YgbWDL2ALwGHQbOijaz6gkZ27Qz8CU3kM0Vr6g4Q/aGujVrrOD/7CDWgOjHEK3RY9jlIMCVkydO0s8qcWq3DiJbGV7XeFz5B0bRvae++2870n7/UgpQX5ime67q4Uf88770/z0PEpmZt///cs59PBVqQTmuPKbFcdjaBknIoZ2NdWssZugWOLylSPoH6xZkwTkmvEvU0u8DIpfrjXc0lir7Z29UEgieNQKpFp+p/u58Z5lksZ/2rsKwdPFzhQmuqs8949OoIHBR4h2Qah/mDF7ttkvxpzol3EgVEj/JHUEKel5RCX20S/D86lzVdhkwFioMADv8Yh4b4vcNzEihZJPF/TNwBC66hY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(6506007)(53546011)(66476007)(8936002)(44832011)(6486002)(38100700002)(508600001)(5660300002)(83380400001)(2616005)(66946007)(66556008)(8676002)(4326008)(316002)(186003)(86362001)(36756003)(31696002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHdZaG9zVXkxRFpnL1RyY0dzSnU0RGtkNEwwWU1TUitmSCtuaVZhb0VZSHhO?=
 =?utf-8?B?VTBZZWhuWWlmRXg1SDROZU9OLy9ESHZwbkE5c0RVUk5YQ0U5STlESU5pMWl5?=
 =?utf-8?B?KzI5bWRiREUrMUl6MTVXczEzZGFpdGpzeUhUSjBYSGM1NDZ5V0VQQWVHZmd5?=
 =?utf-8?B?MWR1OW1xdUZkRE1WMGl1NnJHMzk4dzVzUm5NLzRQclFWWDFnNHh0aUZyVjBU?=
 =?utf-8?B?QXFxNXJONDFla0JnQ2hHa0tnWWN4aGwzQ3pvaWtaN1l4Tk45dklGRDJvRHR3?=
 =?utf-8?B?KzZFS0xRRnJOWHVaWVhlUlZXbjNnenM2Q285NHJtVFlsNE1aM1I0SXNXbFlY?=
 =?utf-8?B?VXlFa2ZwYnJSN3B2dXVMemUveFdROW4rbENvdE0rSkNIeEdJRm0xV1d5Skdw?=
 =?utf-8?B?SXUxMWJPU1BhN2xkN05mVkQvOVhXSXVYMDcyVWNrV3RQMDVZN3JiQzNtWEZE?=
 =?utf-8?B?ZXI5YXV5eFJxU0RNQ0cwQ2E2QStLeFdsSTBLbXNZdE9adEI1bjhtaTdYZFR3?=
 =?utf-8?B?VWo5ZXhuQnVWRkFmc2ROZE9DVVBTTlYrNmpBMFJrd0pEMGJjbEhtTkRtWDVE?=
 =?utf-8?B?QnQ0dnI3K0NBVVpxWVIrdTkwVzVrSlViV1JDbVNuYnJvNVFpb1h0ZGJUMTJl?=
 =?utf-8?B?ZlZ6WFl2dWNrbG8weWFLM09paEpzVmM2NDhrSGVlVlhRZG1BTXBaZ2RNSldm?=
 =?utf-8?B?ODZGWFJ3MFhEZTFRdDh6OHFteTZpMDVjOWNpb0RFSzlGMnVDVWF3cEUzRTln?=
 =?utf-8?B?Y1F2cFBRYWdtUnY4UHFoVHdma2hEQjdLL1ZHbXNQOVFuM2hmR0w0Z0dvUUp6?=
 =?utf-8?B?ZkZFbTlDbStZb0RzR1QzKzZxZmF4d0lpT0RDOFdBdHNBZnFwdWM5c3RVdURr?=
 =?utf-8?B?enBzOWRxSURxKzRHcHlXT1BSN1U3OHltOEhIWnNBbVgvdFFCOXlNbW5McUlp?=
 =?utf-8?B?bnRQS2FVSWQ0bHR6b0JwYVc4eWlNSGhUS2hlTHlWcFA5ZDc4MGV2bnYwK1Vm?=
 =?utf-8?B?eHMwVTUzZFo4M2dhQjlUL3ZQbytoVkJQSzh0M3FrNGdCMGJkMkR2MTNsWEI4?=
 =?utf-8?B?ZnB6c0FqdFkxWEZGd3V1L3phZmN6a0ZtN2VpMXZsenowajJGVTYrd0ZneThZ?=
 =?utf-8?B?UTJnY3NhVjE2dzFWYVhHdjhrdTRKcDJLOWswblFqckxkdkJBdVpuZ3FKamkv?=
 =?utf-8?B?elFUL2JVSklTanpKTnF5T1c1Y2xkTDNVaXpmdkp4akNZbks0SFNadTVJanpU?=
 =?utf-8?B?RzQ0ZEViSlRWQkZ0UGhmK2d6MGRPcXIvZldrdlM2Y1N2SEFKanRwRGxUQk9Y?=
 =?utf-8?B?TVdabWx1SGh4SitkS1RZSFNkVW5rQ0h0MGxlS3FJTnE2OUhwK244Q3lIc3Nh?=
 =?utf-8?B?Uy8rSkc4YjAvbDUwamJrZzJIQVdRM2F2c051bnIvY0psN3dKMTZZdWZLaXN0?=
 =?utf-8?B?dVErYzNZQW5KT0ZDYjA1UlU0ODFpcmk1SGJpdUFSOWdVRlRZRTMybUh1UXdK?=
 =?utf-8?B?akk1Y3Z1L0NuZ21OYXoyRGFXeFpmTE1TVDdzZ1c5eGI3L3pBa0R1OUNmK1JC?=
 =?utf-8?B?QnNrRnRzZDlRMlRJc3pacUhTLzJhb25laC9CeEFud0FISWFZVjRiNmZQY3VO?=
 =?utf-8?B?UnlBandtSUZOZzZuMGd1R1lpRyt4N0hJMkp0b05KOUNQTlpWeUZ0R3pRRk14?=
 =?utf-8?B?Z0JwRlpZV0hRVDdnb2VXTmpnbllrUkJDQU42bkFVOUdtanpwZ2xTcnpvTi8x?=
 =?utf-8?B?bmVuU0RFRnMveWFXM0lCTm80NGhBckpkMEU4TDNvcWlYelpqMEpDYVlsRFh1?=
 =?utf-8?B?NHd2M2hGQ3NBKzNRZ0Y1VEN0dm9hZkpkbTVJQnRyK2p2UWt2Z1NBZU9sK1Vm?=
 =?utf-8?B?QWI0WHg3OERtU0pKci9oRUV1Y2MzNlhVTS9zOHVMUHVyeVYyOHI3TUFOWDZV?=
 =?utf-8?B?WWQ4RFJ6cXJjcFJTd3ZRaXU2N1BGb3h2eTEyYmZLQ0dXZ2I4NVYwZDl5cXVY?=
 =?utf-8?B?Zjl0Nm9LazNEV3FsTFBqTmE5L016VmZQaTIvS3kxd3R3Mmp5ZUtHblFLdmxR?=
 =?utf-8?B?Vkl1eW90dS9mRCthdWFqd0haZXo0RmkzWElhWS9oR3JQdVB0NWZYZ3dodzVI?=
 =?utf-8?B?MTVSVWthM0pwNGVTV2pLbXR6Zm1BVTNyb09JSDdsOWJYQldTT2VFY3F0TGgx?=
 =?utf-8?B?OXg1MHFlUDVCcVdtd2pEWHkrVVhyOVZxV0szRWhDS1gxOGdINmd1S3JKcUhD?=
 =?utf-8?B?UW95K25Ca2JVcnVuSDVqSzdhMWg1V1Nqa0lBTkpjcHpRQmxib2RvNmhtdWhF?=
 =?utf-8?B?b0xXb2FVSEFhSTVIK29EZEt5MTd5T0tzUEdSYjRVdytIV01xSTJVRm5iRXVn?=
 =?utf-8?Q?zCrZs7HWa0NlqCqiRm3nlG9OAZ/tifi7jEO6X?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7915fbe9-85f5-4392-a1de-08da1ef6ebca
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 15:45:09.5090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QOKtfV/2G5JP7z/xKWwbOWoxkJjEH+9Zq2ocSTuTSSdOcQv6NuASlfpByx8CZjrk3XYAVfJfudODw1N0Z6TqKcD9bpNiDDUWpYURLcRo5trrDF+2M9QXNK6/6/IIGS9O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2650
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2777

Hi Sundeep,

On 4/15/22 17:28, Sundeep KOKKONDA wrote:
> [Yocto #13722]
> The Yocto bug reports a few improvements in the gdbserver configuration which improves the configuration of gdb more easier for novice users.
> 
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>   documentation/dev-manual/common-tasks.rst | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 9d4aaa5a6..0e989f78e 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10181,6 +10181,7 @@ debugger.
>      an image recipe::
>   
>         IMAGE_INSTALL:append = " gdbserver"
> +      EXTRA_IMAGE_FEATURES_append = " tools-debug"
>   

Please replace _append with :append.

>      The change makes
>      sure the ``gdbserver`` package is included.
> @@ -10227,14 +10228,14 @@ debugger.
>   
>         $ mkdir debugfs
>         $ cd debugfs
> -      $ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image.rootfs.tar.bz2
> -      $ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image-dbg.rootfs.tar.bz2
> +      $ tar xvfj build-dir/tmp/deploy/images/machine/image.rootfs.tar.bz2
> +      $ tar xvfj build-dir/tmp/deploy/images/machine/image-dbg.rootfs.tar.bz2
>    >   5. *Set up GDB:*
>   
>      Install the SDK (if you built one) and then source the correct
>      environment file. Sourcing the environment file puts the SDK in your
> -   ``PATH`` environment variable.
> +   ``PATH`` environment variable and sets $GDB to the SDK's debugger.
>   

We probably want ``$GDB`` here to highlight it.

For the actual content, there's nothing I can say unfortunately since 
I've never use any of this.

Cheers,
Quentin

