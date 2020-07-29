Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web10.7592.1596033956312444449
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 07:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BG/ahmA1;
 spf=pass (domain: arm.com, ip: 40.107.21.51, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ejfyXtsspLVhkG153LfkGeAHbjMug3DjfdD3f0tVU=;
 b=BG/ahmA1MwnbA1P/V4ikCEbsR6j51uqb53+nUUbwFbtFrqnIP7oGhrQuq11I72+ym1d63kC9bXi/c8Exv6m6lbOxkCjO0WVAmFagGRCIV6RDLNRyzHVv+n0Mhn68gL6euoCWnXuXxW6s1LQ34KXSo0OuZJYvi6iVYR+nM6Hy0l4=
Received: from AM6PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:20b:2e::23)
 by AM5PR0802MB2531.eurprd08.prod.outlook.com (2603:10a6:203:a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Wed, 29 Jul
 2020 14:45:53 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e::4) by AM6PR05CA0010.outlook.office365.com
 (2603:10a6:20b:2e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Wed, 29 Jul 2020 14:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 14:45:53 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62"); Wed, 29 Jul 2020 14:45:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0afddee890a1ad67
X-CR-MTA-TID: 64aa7808
Received: from 2b2d46d9778f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F2D907D4-7606-4183-8325-9554600BE007.1;
	Wed, 29 Jul 2020 14:45:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b2d46d9778f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Jul 2020 14:45:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC47Q4oqiLBp3ydwIjx/H6UzQsjrP/saXZV+BLtgZ5CKEWqkQlEhNIaglEAunvDTA5KLZlAMlkK0ESVpasBK5BNf/GP6KbTnFfcZUzrdlnB/32/cIrrt/3GAdP7ClJun6UrHmBWPYL5J3ddvvdwruOO09qVLpcWkMZfzQZ5H4Y+fl+/pP8+Jbgyv00dkYbwU8QgimuumQpxolJK3WhKKy1ZDey/p9IKUyvYbhKecWFK89bI2DyluwpqZj4v62cIwdNDxPp4GfmDF6nraIn0toXh7UwkoIgpGXVdwZ7OLcUIVfhoUynqm5XEWgcA3zG54T9uqy3sCXaQtk3bj7QIFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ejfyXtsspLVhkG153LfkGeAHbjMug3DjfdD3f0tVU=;
 b=eogoR1khXP1RFxpyKrIozvsCzcq6mP9EnI9D1biqQY3tbvjy1Df8WLTJTgberQNdrdH/8SS1TkVEJfwFoGt2Wv+TdYzR2nrqP9Gv3JJTCz3GCn2R8PU/vumBcsKK7IZdIop8tIARQWXLVYwlE+k2ZBTHwLOQ9fj9O6Qzjd7zeVUx/9UKkon22mE09Oak0Q0trcdAvpA9wn5uA+GRg4NOa9GOSbMoGipUOEMp3EQZsGFJwv6jPQXTGQQGXYIr/Bg8Vwo4xvcTpbLwDF7KcGLn/H9b26evSN1xfSAodsVRqoD0eEAW2wteVDM1JKVtp0LAxfev03zsj8EJbZB96QC8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ejfyXtsspLVhkG153LfkGeAHbjMug3DjfdD3f0tVU=;
 b=BG/ahmA1MwnbA1P/V4ikCEbsR6j51uqb53+nUUbwFbtFrqnIP7oGhrQuq11I72+ym1d63kC9bXi/c8Exv6m6lbOxkCjO0WVAmFagGRCIV6RDLNRyzHVv+n0Mhn68gL6euoCWnXuXxW6s1LQ34KXSo0OuZJYvi6iVYR+nM6Hy0l4=
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB8PR08MB5388.eurprd08.prod.outlook.com (2603:10a6:10:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 14:45:47 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.017; Wed, 29 Jul 2020
 14:45:47 +0000
Subject: Re: [PATCH] ref-manual: Add documentation for kernel-fitimage
To: docs@lists.yoctoproject.org
Cc: nd@arm.com, Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200729143552.16065-1-usama.arif@arm.com>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <aa55cfd1-49fe-92ff-9431-2cc1d15d015b@arm.com>
Date: Wed, 29 Jul 2020 15:45:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200729143552.16065-1-usama.arif@arm.com>
X-ClientProxiedBy: LO2P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::13) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.52) by LO2P265CA0097.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Wed, 29 Jul 2020 14:45:46 +0000
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd4c00fa-ab56-4124-cd41-08d833ce181a
X-MS-TrafficTypeDiagnostic: DB8PR08MB5388:|AM5PR0802MB2531:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2531016BC5DCFA6E67DF76DC92700@AM5PR0802MB2531.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Fs7hr2bZ6xKAo+pj+4mrbyQAi8MDLQPRPj6RHY8za/GUhkRuYczv+d43ftjwjRlkNwyOtdl+goU53LGwkLdxokakqJm5FCG97CIl5j+ZirGYeFsUER7P5+nsh0iaPKbJTLjbppx/oecvuBFCtth2LBJ8icrilN0BLYP9gNHAX+P1peCL/9I8JXChPGuKuQAJRArDWkGS1ZVkSHqPKrm42jj9QNQEI9CgdtuV8BJ1D8zo+ntKJbo9CFcHXihxX6yFKn0h+zOBk3XZ8bV4z8er8/j2GSSQQ7+dFbYVx2maj81wpaPN+UX/AIdKexA8+FwdcH0v9/JCIo/ZX0zI4EOa8u0Yn6+THm+pUiwWea4QiRiUyjyYtd3Yd2/Qz8TKkkDe2jpfRfIPWrGhoFmHAocKJw075Lh1x3BTWyPOBcjvZgz2vDFZRZg4lsQbmNjeSIg8sERt3VLQGQlyqcZ+vF+/ew==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(31686004)(6486002)(16526019)(478600001)(5660300002)(36756003)(83380400001)(4326008)(2906002)(30864003)(186003)(8936002)(52116002)(44832011)(966005)(16576012)(2616005)(31696002)(86362001)(6916009)(956004)(66946007)(316002)(66556008)(53546011)(66476007)(26005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 kZBMZrFuS1GN/u7RzDw3adkQ4Md8Q11WI/Im4R6E5gXXtZ1eNPUqNc+5vR0D5lz3ROXF9GBMrrh9C3bMYwcEe5Ag1msUXsPu9DGfQSRYyheovqblN9R3Wv/D1QbLakqhbBLkY98VFXDd1ZoEDb/6CAfxTHkREHpgHiFgiBfuHogl7QICA3k3Z7iOB18pczryAVZQCybOGmMVC0jW9siChq48Mmdz4jStbO60kYwhLynI6FVQtphBU4QezgMj0UWGspSHJUP9irwCu8Z7fKUbOGA85AAYbMtQiHNqEckIg2iSPHmRhooMsdQpzEGZKTIPmPITpaOds23+LJ/Y2q5tpZgtSLi+ois+cQViYRa4vA/ZwTiZS7RdWwtETn7K5OFyf9hFJVhSO0Xfb4opdT8+C2I3tvdaSBoX77r47BzMiG3DI0ucrhrvY+aup5jxRm01i6WUC561Dv/I2z6P5aX9zYnotC3poWJZpmc5boyM2dYBh9zBx2ti+r9+uE8x1gLw
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5388
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f9d85e1-9eb2-4e4b-0556-08d833ce1423
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oKm7okR65uh2MVsStW5CDpVK+xDUgkhRcqJz4ODSqstGSVnALfCm3z3LL4Bk6lhb/hJrKfp69WwXtBiRQeNYJr2ce4tQWn+qDl8lufhvaXdKjgbYOKZO4owXOIeRR3eHmyqsMZO9v0TiK7QqNxKG31shhnXZuTIXgZjh/LkcdZ1TUaP8t/x5w9WGm0ptgfj72+dAOsVj72Yi4Y17MHx7WthuRw3QQwTPvuHhmoBZR9dRkZW14UZ/8EiCdsELnzyDqsHvXdVdg6BPVQGf11bkHWhG90z5pY+Tf9SIJnrSQ5vPTOHSKNkbP4+EYxZodTKjQ5rzdosNKmgYeJKZ8Le+06eNanM4Lxd7w5gWm4JrTLzO09xQxkb3tTqcjlHKVLDspJRCas3G6AUHw8DXdj2bynAInb/2JBf1v/cFCLi+3gua65n59jkUnfZjn5wB8SmXeURaGT7Ku75DNq8opKzEk3YY83DpoaKo5BIDFOV/jHcJFB1nu/NP3+iMQOMZ5I2n
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(16526019)(966005)(26005)(186003)(16576012)(956004)(53546011)(316002)(2616005)(36906005)(4326008)(478600001)(31696002)(336012)(107886003)(70206006)(356005)(36756003)(81166007)(31686004)(83380400001)(8936002)(2906002)(47076004)(44832011)(86362001)(6916009)(6486002)(82310400002)(30864003)(5660300002)(70586007)(82740400003)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 14:45:53.2735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4c00fa-ab56-4124-cd41-08d833ce181a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2531
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 29/07/2020 15:35, Usama Arif wrote:
> This documents kernel-fitimage.bbclass as well as
> the variables that are required to use the class
> to create a FIT image.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   documentation/ref-manual/ref-classes.xml   |  76 ++++++++++-
>   documentation/ref-manual/ref-variables.xml | 142 +++++++++++++++++++++
>   2 files changed, 217 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
> index ab12373ae0..1dcd5fdd03 100644
> --- a/documentation/ref-manual/ref-classes.xml
> +++ b/documentation/ref-manual/ref-classes.xml
> @@ -1880,8 +1880,82 @@ This check was removed for YP 2.3 release
>   
>       <para>
>           The <filename>kernel-fitimage</filename> class provides support to
> -        pack zImages.
> +        pack a kernel Image, device trees and a RAM disk into a single
> +        FIT image. In theory, a FIT image can support any number of kernels,
> +        RAM disks and device-trees.
> +        However, <filename>kernel-fitimage</filename> currently only supports
> +        limited usescases: just one kernel image, an optional RAM disk, and
> +        any number of device tree.
>       </para>
> +
> +    <para>
> +        To create a FIT image, it is required that
> +        <filename><link linkend='var-KERNEL_CLASSES'>KERNEL_CLASSES</link></filename>
> +        is set to "kernel-fitimage" and
> +        <filename><link linkend='var-KERNEL_IMAGETYPE'>KERNEL_IMAGETYPE</link></filename>
> +        is set to "fitImage".
> +    </para>
> +
> +    <para>
> +        The options for the device tree compiler passed to mkimage -D feature
> +        when creating the FIT image are specified using the
> +        <filename><link linkend='var-UBOOT_MKIMAGE_DTCOPTS'>UBOOT_MKIMAGE_DTCOPTS</link></filename>
> +        variable.
> +    </para>
> +
> +    <para>
> +        Only a single kernel can be added to the FIT image created by
> +        <filename>kernel-fitimage</filename> and the kernel image in FIT is
> +        mandatory.
> +        The address where the kernel image is to be loaded by U-boot is
> +        specified by
> +        <filename><link linkend='var-UBOOT_LOADADDRESS'>UBOOT_LOADADDRESS</link></filename>
> +        and the entrypoint by
> +        <filename><link linkend='var-UBOOT_ENTRYPOINT'>UBOOT_ENTRYPOINT</link></filename>.
> +    </para>
> +
> +    <para>
> +        Multiple device trees can be added to the FIT image created by
> +        <filename>kernel-fitimage</filename> and the device tree is optional.
> +        The address where the device tree is to be loaded by U-boot is
> +        specified by
> +        <filename><link linkend='var-UBOOT_DTBO_LOADADDRESS'>UBOOT_DTBO_LOADADDRESS</link></filename>
> +        for device tree overlays and by
> +        <filename><link linkend='var-UBOOT_DTB_LOADADDRESS'>UBOOT_DTB_LOADADDRESS</link></filename>
> +        for device tree binaries.
> +    </para>
> +
> +    <para>
> +        Only a single RAM disk can be added to the FIT image created by
> +        <filename>kernel-fitimage</filename> and the RAM disk in FIT is
> +        optional.
> +        The address where the RAM disk image is to be loaded by U-boot
> +        is specified by
> +        <filename><link linkend='var-UBOOT_RD_LOADADDRESS'>UBOOT_RD_LOADADDRESS</link></filename>
> +        and the entrypoint by
> +        <filename><link linkend='var-UBOOT_RD_ENTRYPOINT'>UBOOT_RD_ENTRYPOINT</link></filename>.
> +        The ramdisk is added to FIT image when
> +        <filename><link linkend='var-INITRAMFS_IMAGE'>INITRAMFS_IMAGE</link></filename>
> +        is specified.
> +    </para>
> +
> +    <para>
> +        The FIT image generated by <filename>kernel-fitimage</filename> class
> +        is signed when the variables
> +        <filename><link linkend='var-UBOOT_SIGN_ENABLE'>UBOOT_SIGN_ENABLE</link></filename>,
> +        <filename><link linkend='var-UBOOT_MKIMAGE_DTCOPTS'>UBOOT_MKIMAGE_DTCOPTS</link></filename>,
> +        <filename><link linkend='var-UBOOT_SIGN_KEYDIR'>UBOOT_SIGN_KEYDIR</link></filename>
> +        and
> +        <filename><link linkend='var-UBOOT_SIGN_KEYNAME'>UBOOT_SIGN_KEYNAME</link></filename>
> +        are set appropriately.
> +        The default values used for
> +        <filename><link linkend='var-FIT_HASH_ALG'>FIT_HASH_ALG</link></filename>
> +        and
> +        <filename><link linkend='var-FIT_SIGN_ALG'>FIT_SIGN_ALG</link></filename>
> +        in <filename>kernel-fitimage</filename> are "sha256" and "rsa2048"
> +        respectively.
> +    </para>
> +
>   </section>
>   
>   <section id='ref-classes-kernel-grub'>
> diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
> index 8cc7ef8fc9..a5064807e5 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -4991,6 +4991,30 @@
>               </glossdef>
>           </glossentry>
>   
> +        <glossentry id='var-FIT_HASH_ALG'><glossterm>FIT_HASH_ALG</glossterm>
> +            <info>
> +               FIT_HASH_ALG[doc] = "Specifies the hash algorithm used in creating the FIT Image."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Specifies the hash algorithm used in creating the FIT Image.
> +                    For e.g. sha256.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-FIT_SIGN_ALG'><glossterm>FIT_SIGN_ALG</glossterm>
> +            <info>
> +               FIT_SIGN_ALG[doc] = "Specifies the signature algorithm used in creating the FIT Image."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Specifies the signature algorithm used in creating the FIT Image.
> +                    For e.g. rsa2048.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
>           <glossentry id='var-FONT_EXTRA_RDEPENDS'><glossterm>FONT_EXTRA_RDEPENDS</glossterm>
>               <info>
>                   FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
> @@ -15960,6 +15984,38 @@
>               </glossdef>
>           </glossentry>
>   
> +        <glossentry id='var-UBOOT_DTB_LOADADDRESS'><glossterm>UBOOT_DTB_LOADADDRESS</glossterm>
> +            <info>
> +               UBOOT_DTB_LOADADDRESS[doc] = "Specifies the load address for the dtb."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Specifies the load address for the dtb image used by U-boot.
> +                    During FIT image creation, the
> +                    <filename>UBOOT_DTB_LOADADDRESS</filename> variable is used
> +                    in <filename>kernel-fitimage</filename> class to specify the
> +                    load address to be used in creating the dtb sections of
> +                    Image Tree Source for the FIT image.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-UBOOT_DTBO_LOADADDRESS'><glossterm>UBOOT_DTBO_LOADADDRESS</glossterm>
> +            <info>
> +               UBOOT_DTBO_LOADADDRESS[doc] = "Specifies the load address for the dtbo."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Specifies the load address for the dtbo image used by U-boot.
> +                    During FIT image creation, the
> +                    <filename>UBOOT_DTBO_LOADADDRESS</filename> variable is used
> +                    in <filename>kernel-fitimage</filename> class to specify the
> +                    load address to be used in creating the dtbo sections of
> +                    Image Tree Source for the FIT image.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
>           <glossentry id='var-UBOOT_ENTRYPOINT'><glossterm>UBOOT_ENTRYPOINT</glossterm>
>               <info>
>                  UBOOT_ENTRYPOINT[doc] = "Specifies the entry point for the U-Boot image."
> @@ -16045,6 +16101,51 @@
>               </glossdef>
>           </glossentry>
>   
> +        <glossentry id='var-UBOOT_MKIMAGE_DTCOPTS'><glossterm>UBOOT_MKIMAGE_DTCOPTS</glossterm>
> +            <info>
> +               UBOOT_MKIMAGE_DTCOPTS[doc] = "Options for the device tree compiler passed to mkimage '-D' feature."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Options for the device tree compiler passed to mkimage '-D'
> +                    feature while creating FIT image in
> +                    <filename>kernel-fitimage</filename> class.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-UBOOT_RD_LOADADDRESS'><glossterm>UBOOT_RD_LOADADDRESS</glossterm>
> +            <info>
> +               UBOOT_RD_LOADADDRESS[doc] = "Specifies the load address for the ramdisk image."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Specifies the load address for the RAM disk image.
> +                    During FIT image creation, the
> +                    <filename>UBOOT_RD_LOADADDRESS</filename> variable is used
> +                    in <filename>kernel-fitimage</filename> class to specify the
> +                    load address to be used in creating the Image Tree Source for
> +                    the FIT image.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-UBOOT_RD_ENTRYPOINT'><glossterm>UBOOT_RD_ENTRYPOINT</glossterm>
> +            <info>
> +               UBOOT_RD_ENTRYPOINT[doc] = "Specifies the entrypoint for the ramdisk image."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Specifies the entrypoint for the RAM disk image.
> +                    During FIT image creation, the
> +                    <filename>UBOOT_RD_ENTRYPOINT</filename> variable is used
> +                    in <filename>kernel-fitimage</filename> class to specify the
> +                    entrypoint to be used in creating the Image Tree Source for
> +                    the FIT image.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
>           <glossentry id='var-UBOOT_SUFFIX'><glossterm>UBOOT_SUFFIX</glossterm>
>               <info>
>                  UBOOT_SUFFIX[doc] = "Points to the generated U-Boot extension."
> @@ -16063,6 +16164,47 @@
>               </glossdef>
>           </glossentry>
>   
> +        <glossentry id='var-UBOOT_SIGN_ENABLE'><glossterm>UBOOT_SIGN_ENABLE</glossterm>
> +            <info>
> +               UBOOT_SIGN_KEYDIR[doc] = "Enable signing of FIT image."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Enable signing of FIT image. The default value is "0".
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-UBOOT_SIGN_KEYDIR'><glossterm>UBOOT_SIGN_KEYDIR</glossterm>
> +            <info>
> +               UBOOT_SIGN_KEYDIR[doc] = "Location of the directory containing the RSA key and certificate used for signing FIT image."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    Location of the directory containing the RSA key and
> +                    certificate used for signing FIT image.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
> +        <glossentry id='var-UBOOT_SIGN_KEYNAME'><glossterm>UBOOT_SIGN_KEYNAME</glossterm>
> +            <info>
> +               UBOOT_SIGN_KEYNAME[doc] = "The name of keys used for signing U-boot FIT image"
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    The name of keys used for signing U-boot FIT image stored in
> +                    <filename><link linkend='var-UBOOT_SIGN_KEYDIR'>UBOOT_SIGN_KEYDIR</link></filename>
> +                    directory. For e.g. dev.key key and dev.crt certificate
> +                    stored in
> +                    <filename><link linkend='var-UBOOT_SIGN_KEYDIR'>UBOOT_SIGN_KEYDIR</link></filename>
> +                    directory will have
> +                    <filename><link linkend='var-UBOOT_SIGN_KEYNAME'>UBOOT_SIGN_KEYNAME</link></filename>
> +                    set to "dev".
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
>           <glossentry id='var-UBOOT_TARGET'><glossterm>UBOOT_TARGET</glossterm>
>               <info>
>                  UBOOT_TARGET[doc] = "Specifies the target used for building U-Boot."
> 

Hi

This documentation assumes that the case for a single kernel and single 
RAM disk with no dtb is supported by kernel-fitimage.bbclass. 
https://lists.openembedded.org/g/openembedded-core/message/140810 adds 
support for this combination of usecase.

Thanks,
Usama
