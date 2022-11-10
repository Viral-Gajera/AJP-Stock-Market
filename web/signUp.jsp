<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0" />

        <!-- TAILWIND CDN -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- CONFIG JS -->
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            primary: "#2196F3",
                        },
                    },
                },
            };
        </script>

        <!-- CUSTOM CSS -->
        <style type="text/tailwindcss">
            @layer utilities {
                .content-auto {
                    content-visibility: auto;
                }
            }
        </style>
    </head>
    <body
        class="flex items-center justify-center min-h-screen text-white bg-gradient-to-bl from-gray-900 to-black">
        <!-- NAVIGATION BAR -->
        <section>
            <div
                class="fixed top-0 left-[50%] mx-auto flex h-16 w-11/12 -translate-x-[50%] items-center justify-between">
                <!-- LEFT SECTION : LOGO -->
                <div class="flex items-center">
                    <span>
                        <a href="./index.html">
                            <img
                            class="w-10 mx-2"
                            src="./Img/tradingview.png"
                            alt="" />
                        </a>
                    </span>
                    <span
                        class="text-xl font-bold text-white">
                        Trading View
                    </span>
                </div>

                <!-- RIGHT SECTION : LINKS -->
                <div class="mr-2 font-bold"></div>
            </div>
        </section>

        <!-- MAIN SECTION -->
        <section class="">
            <!-- CONTAINER -->
            <div
                class="px-12 py-10 mx-auto bg-gray-800 rounded-lg">
                <!-- HEADING -->
                <h1
                    class="mb-10 text-xl font-bold text-center">
                    Enter your details
                </h1>

                <!-- FORM -->
                <form
                    action="saveUser.jsp"
                    class="flex flex-col items-center justify-center">
                    <!-- GRID CONTAINER -->
                    <div class="grid grid-cols-2">
                        <!-- FIRST GRID ITEMS -->
                        <div class="px-8">
                            <!-- FIRST NAME -->
                            <div
                                class="mt-5 border-b-2">
                                <div
                                    class="pl-0.5">
                                    First Name
                                </div>
                                <div
                                    class="flex items-center mb-2">
                                    <span
                                        ><img
                                            class="inline w-6 mt-2 mr-4"
                                            src="./Img/icons8-user-48.png"
                                            alt=""
                                    /></span>
                                    <input
                                        class="inline w-56 mt-2 bg-transparent outline-none"
                                        type="text"
                                        placeholder="Type user name is here"
                                        name="first_name"
                                        id="" 
                                        required />
                                </div>
                            </div>
                            <!-- ACCOUNT NO -->
                            <div
                                class="mt-5 border-b-2">
                                <div
                                    class="pl-0.5">
                                    Account No
                                </div>
                                <div
                                    class="flex items-center mb-2">
                                    <span
                                        ><img
                                            class="inline w-5 mt-2 mr-4"
                                            src="./Img/icons8-merchant-account-100.png"
                                            alt=""
                                    /></span>
                                    <input
                                        class="inline mt-2 bg-transparent outline-none"
                                        type="text"
                                        placeholder="Type password is here"
                                        name="account_no"
                                        id=""
                                        required />
                                </div>
                            </div>

                            <!-- PAN NO -->
                            <div
                                class="mt-5 border-b-2">
                                <div
                                    class="pl-0.5">
                                    Pan No
                                </div>
                                <div
                                    class="flex items-center mb-2">
                                    <span
                                        ><img
                                            class="inline w-5 mt-2 mr-4"
                                            src="./Img/icons8-debit-card-100.png"
                                            alt=""
                                    /></span>
                                    <input
                                        class="inline mt-2 bg-transparent outline-none"
                                        type="text"
                                        placeholder="Type password is here"
                                        name="pan_no"
                                        id="" 
                                        required />
                                </div>
                            </div>
                        </div>

                        <!-- SECOND GRID ITEMS -->
                        <div class="px-8">
                            <!-- LAST NAME -->
                            <div
                                class="mt-5 border-b-2">
                                <div
                                    class="pl-0.5">
                                    Last Name
                                </div>
                                <div
                                    class="flex items-center mb-2">
                                    <span
                                        ><img
                                            class="inline w-6 mt-2 mr-4"
                                            src="./Img/icons8-user-48.png"
                                            alt=""
                                    /></span>
                                    <input
                                        class="inline mt-2 bg-transparent outline-none"
                                        type="text"
                                        placeholder="Type user name is here"
                                        name="last_name"
                                        id=""
                                        required />
                                </div>
                            </div>
                            <!-- EMAIL ADDRESS -->
                            <div
                                class="mt-5 border-b-2">
                                <div
                                    class="pl-0.5">
                                    Email Address
                                </div>
                                <div
                                    class="flex items-center mb-2">
                                    <span
                                        ><img
                                            class="inline w-5 mt-2 mr-4"
                                            src="./Img/icons8-secured-letter-90.png"
                                            alt=""
                                    /></span>
                                    <input
                                        class="inline mt-2 bg-transparent outline-none"
                                        type="email"
                                        placeholder="Type password is here"
                                        name="email"
                                        id="" 
                                        required/>
                                </div>
                            </div>
                            <!-- PASSWORD -->
                            <div
                                class="mt-5 border-b-2">
                                <div
                                    class="pl-0.5">
                                    Password
                                </div>
                                <div
                                    class="flex items-center mb-2">
                                    <span
                                        ><img
                                            class="inline w-5 mt-2 mr-4"
                                            src="./Img/icons8-lock.svg"
                                            alt=""
                                    /></span>
                                    <input
                                        class="inline mt-2 bg-transparent outline-none"
                                        type="password"
                                        placeholder="Type password is here"
                                        name="password"
                                        id="" 
                                        required/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-12">
                        <label for="signUp" >
                        <div
                            class="px-20 py-2 rounded-full bg-primary">
                            <input type="submit" value="Sign Up" itemref="signUp" >
                        </div>
                    </label>
                    </div>
                </form>
            </div>
        </section>
    </body>
</html>
